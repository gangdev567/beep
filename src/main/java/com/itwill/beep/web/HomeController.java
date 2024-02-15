package com.itwill.beep.web;

import com.itwill.beep.domain.ChannelEntity;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.domain.StreamingState;
import com.itwill.beep.dto.ChatRoom;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.ChatService;
import com.itwill.beep.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {

    private final UserService userService;
    private final ChatService chatService;
    private final ChannelService channelService;

    @GetMapping("/")
    @PreAuthorize("permitAll")
    public String home(Model model) {
        // 로그인한 유저 정보를 가지고 있는 클래스에서 username이 anonymousUser(익명)이 아닐경우에
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        if (!"anonymousUser".equals(username)) { // 여기를 수정했습니다.

            // 로그인한 유저 정보를 불러온다.
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

            // 유저 정보에서 유저의 아이디를 불러온다.
            String userName = authentication.getName();
            log.info("userName = {}", userName);

            // 유저 아이디로 유저의 상세정보를 불러올 쿼리를 실행한다.
            UserAccountEntity userAccountEntity = userService.findUserByUserName(userName);

            // model에 user를 보낸다.
            model.addAttribute("userAccount", userAccountEntity);

            ChannelEntity channel = channelService.findChannelByUserAccount(userAccountEntity);
            log.info("channel = {}", channel);

            if (channel != null) {
                model.addAttribute("channel", channel);
                // channel이 null이 아닐 때만 상태를 가져옵니다.
                String status = channel.getStreamingStateSet().toString();
                model.addAttribute("status", status);
            } else {
                // channel이 null일 경우 기본 값을 설정할 수 있습니다.
                model.addAttribute("status", "No Channel");
            }
        }

        // 현재 진행중인 방송의 리스트를 홈으로 보낸다.
        List<ChatRoom> broadcastList = chatService.findAllRoom();

        // 처음에 구조 설계를 잘못잡고 들어가서 chatroom을 따로 만들고 그 정보로 다시 채널 정보를 가져온다.
        List<ChannelEntity> channelList = broadcastList.stream().map(room -> convertToChannel(room))
            .filter(channel -> channel != null && channel.getStreamingStateSet().contains(StreamingState.ON))
            .collect(Collectors.toList());

        model.addAttribute("channelList", channelList);

        return "home";
    }

    private ChannelEntity convertToChannel(ChatRoom room) {
        Long channelId = room.getRoomId();
        log.info("channelId = {}", channelId);
        ChannelEntity channel = channelService.findChannelById(channelId);
        log.info("channel = {}", channel);
        return channel;
    }

}
