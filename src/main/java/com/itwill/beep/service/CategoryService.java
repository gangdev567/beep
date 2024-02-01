package com.itwill.beep.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.api.igdb.apicalypse.APICalypse;
import com.api.igdb.apicalypse.Sort;
import com.api.igdb.exceptions.RequestException;
import com.api.igdb.request.IGDBWrapper;
import com.api.igdb.request.ProtoRequestKt;
import com.api.igdb.request.TwitchAuthenticator;
import com.api.igdb.utils.TwitchToken;
import com.itwill.beep.domain.Category;
import com.itwill.beep.domain.CategoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import proto.Cover;

@Slf4j
@RequiredArgsConstructor
@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    // Twitch API 클라이언트 정보
    @Value("${spring.security.oauth2.client.registration.twitch.client-id}")
    private String clientId;
    @Value("${spring.security.oauth2.client.registration.twitch.client-secret}")
    private String clientSecret;

    /**
     * TotalView 컬럼의 값의 내림차순으로 카테고리를 정렬 한 값을 리스트에 저장합니다.
     * 
     * @return 시청자 로그인 수로 정렬한 카테고리 목록
     */

    public List<Category> findByTotalViewers() {
        log.info("findByTotalViewers()");
        List<Category> list = categoryRepository.findByTotalViewNotNullOrderByTotalViewDesc();

        return list;
    }

    /**
     * IGDB API를 통해 게임 목록을 가져와 카테고리로 저장합니다.
     *
     * @return 저장된 카테고리 목록
     */

    public List<Category> findAllAndSaveCategories() {
        log.info("findAllAndSaveCategories()");
        List<Category> savedCategories = new ArrayList<>();

        // Twitch API 토큰 요청
        TwitchAuthenticator tAuth = TwitchAuthenticator.INSTANCE;
        TwitchToken token = tAuth.requestTwitchToken(clientId, clientSecret);
        IGDBWrapper.INSTANCE.setCredentials(clientId, token.getAccess_token());

        // IGDB API를 통해 인기 게임 목록 조회
        APICalypse gamesQuery =
                new APICalypse().fields("*").limit(6).sort("total_rating_count", Sort.DESCENDING);

        try {
            var games = ProtoRequestKt.games(IGDBWrapper.INSTANCE, gamesQuery);

            for (var game : games) {
                // 각 게임에 대한 커버 정보 가져오기
                Cover cover = getCoverForGame(game.getId());
                if (cover != null) {
                    String originalUrl = cover.getUrl();
                    String modifiedUrl = originalUrl.replace("/t_thumb/", "/t_cover_big/");

                    // Category 엔터티 생성 및 저장
                    Category category = Category.builder().categoryId(game.getId())
                            .categoryName(game.getName()).imageUrl(modifiedUrl).build();

                    savedCategories.add(categoryRepository.save(category));
                } else {
                    // 커버가 없는 경우 기본 URL 사용
                    String defaultStaticUrl = "/images/no_cover_image.jpg";
                    Category category = Category.builder().categoryId(game.getId())
                            .categoryName(game.getName()).imageUrl(defaultStaticUrl).build();

                    savedCategories.add(categoryRepository.save(category));
                }
            }

        } catch (RequestException e) {
            log.error("RequestException");
            e.printStackTrace();
        }

        return savedCategories;
    }

    /**
     * IGDB API를 통해 키워드로 게임을 검색하고 결과를 카테고리로 저장합니다.
     *
     * @param keyword 검색 키워드
     * @return 검색된 카테고리 목록
     */
    public List<Category> searchGames(String keyword) {
        log.info("searchGames(keyword={})", keyword);
        List<Category> foundGames = new ArrayList<>();

        // Twitch API 토큰 요청
        TwitchAuthenticator tAuth = TwitchAuthenticator.INSTANCE;
        TwitchToken token = tAuth.requestTwitchToken(clientId, clientSecret);
        IGDBWrapper.INSTANCE.setCredentials(clientId, token.getAccess_token());

        // IGDB API를 통해 키워드로 게임 검색
        APICalypse gameFindQuery = new APICalypse().search(keyword).fields("*").limit(6);

        try {
            var games = ProtoRequestKt.games(IGDBWrapper.INSTANCE, gameFindQuery);

            // 검색 결과가 없을 경우
            if (games.isEmpty()) {
                return foundGames; // 빈 리스트 반환
            }

            for (var game : games) {
                // 커버가 null이 아닌 경우에만 처리
                Cover cover = getCoverForGame(game.getId());
                if (cover != null) {
                    String originalUrl = cover.getUrl();
                    String modifiedUrl = originalUrl.replace("/t_thumb/", "/t_cover_big/");

                    // Category 엔터티 생성 및 저장
                    Category category = Category.builder().categoryId(game.getId())
                            .categoryName(game.getName()).imageUrl(modifiedUrl).build();

                    foundGames.add(categoryRepository.save(category));
                } else {
                    // 커버가 없는 경우 기본 URL 사용
                    String defaultStaticUrl = "/images/no_cover_image.jpg";
                    Category category = Category.builder().categoryId(game.getId())
                            .categoryName(game.getName()).imageUrl(defaultStaticUrl).build();

                    foundGames.add(categoryRepository.save(category));
                }
            }

        } catch (RequestException e) {
            log.error("RequestException");
            e.printStackTrace();
        }

        return foundGames;
    }

    /**
     * 게임 ID에 해당하는 커버 정보를 IGDB API에서 가져옵니다.
     *
     * @param gameId 게임 ID
     * @return 게임의 커버 정보 (존재하지 않으면 null 반환)
     * @throws RequestException IGDB API 요청 중 발생한 예외
     */
    private Cover getCoverForGame(long gameId) throws RequestException {
        APICalypse coverQuery = new APICalypse().fields("*").where("game = " + gameId).limit(1);
        var covers = ProtoRequestKt.covers(IGDBWrapper.INSTANCE, coverQuery);

        return covers.isEmpty() ? null : covers.get(0);
    }

}
