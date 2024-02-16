package com.itwill.beep.web;

import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.StreamingState;
import com.itwill.beep.domain.UserAccountEntity;

import java.util.Set;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.itwill.beep.domain.UserRoleType;
import com.itwill.beep.dto.ChatRoom;
import com.itwill.beep.service.BannedUserService;
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
    private final BannedUserService banSvc;

    @GetMapping("/channel/{id}")
    public String channel(@PathVariable(name = "id") String id, Model model) {
        log.info("{}의 채널", id);
        // 로그인한 유저 정보를 가지고 있는 클래스에서 username이 anonymousUser(익명)이 아닐경우에
        if (SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {

            // 로그인한 유저 정보를 불러온다.
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

            // 유저 정보에서 유저의 아이디를 불러온다.
            String username = authentication.getName();
            log.info("username = {}", username);

            // 유저 아이디로 유저의 상세정보를 불러올 쿼리를 실행한다.
            UserAccountEntity user = userSvc.findUserByUserName(username);

            // pathvariable로 스트리머 정보를 가져온다
            UserAccountEntity streamer = userSvc.findUserByUserNickname(id);
            log.info("streamer = {}", streamer);
            model.addAttribute("streamer", streamer);
            
            // user의 follow 여부를 체크한다. 
            boolean followCheck = followSvc.isFollowing(user, streamer);
            
            if(user.getUserId() == streamer.getUserId()){
                model.addAttribute("userState", "STREAMER");
            } else if(followCheck == true) {
                model.addAttribute("userState", "FOLLOW");
            } else if(followCheck == true) {
                model.addAttribute("userState", "FOLLOW");
            } else if(followCheck == false){
                model.addAttribute("userState", "NON_FOLLOW");
            }
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
            
            //시청자 수 증가
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

        } else if (SecurityContextHolder.getContext().getAuthentication()
                .getName() == "anonymousUser") {
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
            
            //시청자 수 증가
            channelSvc.increaseViewers(channelId);
            model.addAttribute("channel", channel);

            // channelId로 room 정보를 찾는다.
            ChatRoom room = chatSvc.findRoomById(channelId);
            log.info("room = {}", room);
            model.addAttribute("room", room);

        }

        return "/channel";

    }
    
}
