package com.itwill.beep.domain;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final UserAccountRepository userAccountRepository;
    private final PasswordEncoder passwordEncoder;
    private final CategoryRepository categoryRepository;
    private final ChannelRepository channelRepository;

    /**
     * OAuth2 사용자 정보를 처리하는 메소드.
     * 
     * @param userRequest OAuth2 사용자 정보 요청 객체
     * @return 처리된 OAuth2 사용자 객체
     * @throws OAuth2AuthenticationException OAuth2 인증 예외
     */
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oauth2User = super.loadUser(userRequest);

        Map<String, Object> attributes = oauth2User.getAttributes();

        String userEmail = (String) attributes.get("email");
        String userName = (String) attributes.get("name");

        validateSocialInfo(userEmail, userName);

        UserAccountEntity userEntity = userAccountRepository.findByUserEmail(userEmail)
                .orElseGet(() -> createUserAndChannel(userEmail, userName));

        Set<GrantedAuthority> authorities = userEntity.getUserRoles()
                .stream()
                .map(role -> new SimpleGrantedAuthority("ROLE_" + role.name()))
                .collect(Collectors.toSet());

        // 사용자 정보 로깅
        if (userEntity.getUserId() != null) {
            log.info("소셜 로그인 사용자 생성 완료: {}", userEntity);
        } else {
            log.info("소셜 로그인 사용자 이미 존재: {}", userEntity);
        }

        return new DefaultOAuth2User(authorities, attributes, "sub");
    }

    /**
     * SocialDto의 정보가 유효한지 검증.
     * 
     * @param userEmail 사용자 이메일
     * @param userName  사용자 이름
     * @throws OAuth2AuthenticationException SocialDto 정보가 유효하지 않을 때 발생하는 예외
     */
    private void validateSocialInfo(String userEmail, String userName) {
        if (userEmail == null || userName == null) {
            throw new OAuth2AuthenticationException("유효하지 않은 사용자 정보");
        }
    }

    /**
     * 새로운 사용자 및 채널을 생성하고 저장.
     * 
     * @param userEmail 사용자 이메일
     * @param userName  사용자 이름
     * @return 저장된 사용자 객체
     */
    private UserAccountEntity createUserAndChannel(String userEmail, String userName) {
        UserAccountEntity newUserEntity = UserAccountEntity.builder()
                .userEmail(userEmail)
                .userName(userName)
                .userNickname("google")  // 이 부분은 원하는 값으로 수정해주세요.
                .userPassword(passwordEncoder.encode(UUID.randomUUID().toString()))  // 더미 패스워드
                .build();
        newUserEntity.addUserRole(UserRoleType.SOCIAL);

        // userId // 역할 설정
        newUserEntity.addUserRole(UserRoleType.USER);

        // streamingKey 생성 및 설정
        String streamingKey = generateStreamingKey();
        newUserEntity.updateUserStreamingKey(streamingKey);

        // 사용자 계정 저장
        userAccountRepository.save(newUserEntity);

        // 새 채널을 위한 카테고리 조회 또는 생성
        CategoryEntity categoryEntity = categoryRepository.findById(115L)
            .orElseThrow(() -> new RuntimeException("카테고리를 찾을 수 없습니다."));

        // 채널 생성 및 사용자 계정과 연결
        ChannelEntity channelEntity = createChannel(newUserEntity, categoryEntity);

        // 채널 저장
        channelRepository.save(channelEntity);

        return newUserEntity;
    }

    /**
     * 사용자와 카테고리에 따라 채널을 생성.
     * 
     * @param userEntity      사용자 엔터티
     * @param categoryEntity  카테고리 엔터티
     * @return 생성된 채널 엔터티
     */
    private ChannelEntity createChannel(UserAccountEntity userEntity, CategoryEntity categoryEntity) {
        if (userEntity == null || userEntity.getUserNickname() == null) {
            throw new RuntimeException("사용자 정보가 올바르지 않습니다.");
        }
        return ChannelEntity.builder()
                .channelUserAccountEntity(userEntity)
                .categoryEntityOfChannel(categoryEntity)
                .channelContent("환영합니다! 새로운 채널입니다.")
                .channelCreatedTime(LocalDateTime.now())
                .channelProfileImg("default_profile.png")
                .channelTitle(userEntity.getUserNickname() + "님의 채널")
                .channelViewerCount(0L)
                .build();
    }

    /**
     * 랜덤한 스트리밍 키를 생성.
     * 
     * @return 생성된 스트리밍 키
     */
    private String generateStreamingKey() {
        return UUID.randomUUID().toString();
    }
}
