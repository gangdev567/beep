package com.itwill.beep.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.domain.UserRoleType;
import com.itwill.beep.dto.ChatRoom;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.ChatService;
import com.itwill.beep.service.FollowService;
import com.itwill.beep.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChannelController {

    private final UserService userSvc;
    private final ChatService chatSvc;
    private final ChannelService channelSvc;
    private final FollowService followSvc;

    @GetMapping("/channel/{id}")
    public String channel(@PathVariable(name = "id") String id, Model model) {
        log.info("{}의 채널", id);

        // 로그인한 유저 정보를 가져옴
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            UserAccountEntity user;

            if (authentication.getPrincipal() instanceof UserAccountEntity) {
                // 일반적인 로그인 사용자일 경우
                user = (UserAccountEntity) authentication.getPrincipal();
            } else if (authentication instanceof OAuth2AuthenticationToken) {
                // 소셜 로그인 사용자일 경우
                OAuth2AuthenticationToken oauthToken = (OAuth2AuthenticationToken) authentication;
                String userEmail = oauthToken.getPrincipal().getAttribute("email");

                user = userSvc.findByUserEmail(userEmail).orElseThrow();
            } else {
                // 다른 타입의 인증 정보에 대한 처리
                throw new RuntimeException("지원하지 않는 인증 타입입니다.");
            }

            // 일반 로그인 사용자일 경우에만 username을 사용하여 상세 정보를 가져옴
            if (!(authentication instanceof OAuth2AuthenticationToken)) {
                String username = authentication.getName();
                user = userSvc.findUserByUserName(username);
            }

            // pathvariable로 스트리머 정보를 가져온다
            UserAccountEntity streamer = userSvc.findUserByUserNickname(id);
            log.info("streamer = {}", streamer);
            model.addAttribute("streamer", streamer);

            // user의 follow 여부를 체크한다.
            boolean followCheck = followSvc.isFollowing(user, streamer);

            // user 상태를 결정하는 메소드 추가
            String userState = determineUserState(user, streamer, followCheck);
            model.addAttribute("userState", userState);

            // model에 user를 보낸다.
            log.info("user = {}", user);
            model.addAttribute("userAccount", user);

            // streamer정보로 channel정보를 불러온다.
            ChannelEntity channel = channelSvc.findChannelByUserAccount(streamer);
            log.info("channel = {}", channel);
            Long channelId = channel.getChannelId();

            // 채팅창 정보를 보낸다.
            String chatState = channel.getChatStateSet().toString();
            model.addAttribute("chatState", chatState);

            // 시청자 수 증가
            channelSvc.increaseViewers(channelId);
            model.addAttribute("channel", channel);

            // channelId로 room 정보를 찾는다.
            ChatRoom room = chatSvc.findRoomById(channelId);
            log.info("room = {}", room);
            model.addAttribute("room", room);

            // 스트리머의 스트림키를 기반으로 스트리밍 URL 생성
            String streamingKey = streamer.getUserStreamingKey(); // 스트리머의 스트리밍 키를 가져온다.
            String streamingUrl = String.format("http://localhost:8088/streaming/hls/%s.m3u8", streamingKey); // 스트리밍 URL 동적 생성
            model.addAttribute("streamingUrl", streamingUrl);

            // channel.status는 Set타입 객체다 그래서인지 th:if 조건문에서 계속 실패했다.
            // 타임리프로 해결하는 방안이 있을 것이라고 생각은 하지만 공식문서를 뒤져봐도 해결법은 찾지 못했다.
            // 그래서 그냥 컨트롤러 부분에서 문자열로 변환하여 보내기로 했다. (해결법은 찾았지만 결국엔 이게 정답이었다.)
            ChannelEntity myChannel = channelSvc.findChannelByUserAccount(user);
            String status = myChannel.getStreamingStateSet().toString();
            model.addAttribute("status", status);

        } else if (authentication != null && "anonymousUser".equals(authentication.getName())) {
            // 비로그인 시청자가 방송을 시청하려고 하는 경우
            UserAccountEntity user = UserAccountEntity.builder().userNickname("anonymousUser").build();
            user.addUserRole(UserRoleType.USER);

            UserAccountEntity streamer = userSvc.findUserByUserNickname(id);
            log.info("streamer = {}", streamer);
            model.addAttribute("streamer", streamer);

            // model에 user를 보낸다.
            model.addAttribute("userAccount", user);
            model.addAttribute("userState", "ANONYMOUS");
            log.info("user = {}", user);

            // streamer정보로 channel정보를 불러온다.
            ChannelEntity channel = channelSvc.findChannelByUserAccount(streamer);
            log.info("channel = {}", channel);
            model.addAttribute("channel", channel);
            Long channelId = channel.getChannelId();

            // 채팅창 정보를 보낸다.
            String chatState = channel.getChatStateSet().toString();
            model.addAttribute("chatState", chatState);

            // 시청자 수 증가
            channelSvc.increaseViewers(channelId);
            model.addAttribute("channel", channel);

            // channelId로 room 정보를 찾는다.
            ChatRoom room = chatSvc.findRoomById(channelId);
            log.info("room = {}", room);
            model.addAttribute("room", room);
        }

        return "/channel";
    }

    // user 상태를 결정하는 메소드 추가
    private String determineUserState(UserAccountEntity user, UserAccountEntity streamer, boolean followCheck) {
        if (user.getUserId() == streamer.getUserId()) {
            return "STREAMER";
        } else if (followCheck) {
            return "FOLLOW";
        } else {
            return "NON_FOLLOW";
        }
    }
}
