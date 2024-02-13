package com.itwill.beep.service;

import com.itwill.beep.domain.CategoryEntity;
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
import com.itwill.beep.domain.CategoryRepository;
import com.itwill.beep.domain.ChannelRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import proto.Cover;

@Slf4j
@RequiredArgsConstructor
@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;
    private final ChannelRepository channelRepository;
    private final String defaultStaticUrl = "/images/no_cover_image.jpg";

    // Twitch API 클라이언트 정보
    @Value("${spring.security.oauth2.client.registration.twitch.client-id}")
    private String clientId;
    @Value("${spring.security.oauth2.client.registration.twitch.client-secret}")
    private String clientSecret;

    /**
     * TotalView 컬럼의 값의 내림차순으로 카테고리를 정렬한 값을 리스트에 저장합니다.
     * 
     * @return 시청자 로그인 수로 정렬한 카테고리 목록
     */
    public List<CategoryEntity> findByTotalViewers() {
        log.info("findByTotalViewers()");
        List<CategoryEntity> categories = categoryRepository.findByCategoryTotalViewNotNullOrderByCategoryTotalViewDesc();

        return categories;
    }

    public CategoryEntity findByCategoryIdIs(Long categoryId) {
        log.info("findByCategoryId(categoryId={})", categoryId);
        CategoryEntity category = categoryRepository.findByCategoryId(categoryId);

        return category;
    }

    /**
     * IGDB API를 통해 게임 목록을 가져와 카테고리로 저장합니다.
     *
     * @return 저장된 카테고리 목록
     */
    @Transactional
    public List<CategoryEntity> findAllAndSaveCategories() {
        log.info("findAllAndSaveCategories()");
        List<CategoryEntity> savedCategories = new ArrayList<>();

        // Twitch API 토큰 요청
        setTwitchAuthCredentials();

        // IGDB API를 통해 인기 게임 목록 조회
        APICalypse gamesQuery =
                new APICalypse().fields("*").limit(30).sort("rating_count", Sort.DESCENDING);

        try {
            var games = ProtoRequestKt.games(IGDBWrapper.INSTANCE, gamesQuery);
            for (var game : games) {
                // 이미 저장된 CategoryEntity 확인
                CategoryEntity existingCategory =
                        categoryRepository.findByCategoryId(game.getId());

                if (existingCategory == null) {
                    // 각 게임에 대한 커버 정보 가져오기
                    Cover cover = getCoverForGame(game.getId());

                    String imageUrl =
                            (cover != null) ? cover.getUrl().replace("/t_thumb/", "/t_cover_big/")
                                    : defaultStaticUrl;

                    // CategoryEntity 엔터티 생성 및 저장
                    CategoryEntity category = CategoryEntity.builder().categoryId(game.getId())
                            .categoryName(game.getName()).categoryImageUrl(imageUrl).build();

                    savedCategories.add(categoryRepository.save(category));
                } else {
                    // 이미 존재하면 넘어감
                    savedCategories.add(existingCategory);
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
    @Transactional
    public List<CategoryEntity> searchGames(String keyword) {
        log.info("searchGames(keyword={})", keyword);
        List<CategoryEntity> foundGames = new ArrayList<>();

        // Twitch API 토큰 요청
        setTwitchAuthCredentials();

        // IGDB API를 통해 키워드로 게임 검색
        APICalypse gameFindQuery = new APICalypse().search(keyword).fields("name").limit(6);

        try {
            var games = ProtoRequestKt.games(IGDBWrapper.INSTANCE, gameFindQuery);
            // 검색 결과가 없을 경우
            if (games.isEmpty()) {
                return foundGames; // 빈 리스트 반환
            }

            for (var game : games) {

                CategoryEntity existingCategory =
                        categoryRepository.findByCategoryId(game.getId());

                if (existingCategory == null) {
                    // 각 게임에 대한 커버 정보 가져오기
                    Cover cover = getCoverForGame(game.getId());

                    String imageUrl =
                            (cover != null) ? cover.getUrl().replace("/t_thumb/", "/t_cover_big/")
                                    : defaultStaticUrl;

                    // CategoryEntity 엔터티 생성 및 저장
                    CategoryEntity category = CategoryEntity.builder().categoryId(game.getId())
                            .categoryName(game.getName()).categoryImageUrl(imageUrl).build();

                    foundGames.add(categoryRepository.save(category));
                } else {
                    // 이미 존재하면 넘어감
                    foundGames.add(existingCategory);
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

    /**
     * Twitch API로부터 인증 토큰을 가져와 IGDB API에 인증 정보를 설정합니다.
     */
    private void setTwitchAuthCredentials() {
        TwitchAuthenticator twitchAuthenticator = TwitchAuthenticator.INSTANCE;
        // requestTwitchToken 메서드를 호출 -> Twitch API 접근 가능한 토큰 요청.
        TwitchToken twitchToken = twitchAuthenticator.requestTwitchToken(clientId, clientSecret);
        // clientId와 twitchToken.getAccess_token()을 인자로 전달하여 IGDB API에 접근할 수 있는 인증 정보 설정.
        IGDBWrapper.INSTANCE.setCredentials(clientId, twitchToken.getAccess_token());

    }

}
