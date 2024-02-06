package com.itwill.beep.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Broadcast;
import com.itwill.beep.domain.Channel;
import com.itwill.beep.dto.BroadcastOnDto;
import com.itwill.beep.dto.ChatRoom;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.ChatService;
import com.itwill.beep.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/broadcast")
public class BroadcastController {

    private final UserService userSvc;
    private final ChatService chatSvc;
    private final ChannelService channelSvc;

    @PostMapping("/on")
    public String broadcastOn(Model model, BroadcastOnDto dto) {

        if (SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {

            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();
            log.info("username = {}", username);

            Account user = userSvc.loginUser(username);
            model.addAttribute("user", user);
            model.addAttribute("streamer", user);

            Channel channel = channelSvc.findChannelByAccount(user);
            channel.setStatus(Broadcast.ON);
            channelSvc.update(dto);
            
            // 업데이트 후 다시 불러오기
            channel = channelSvc.findChannelByAccount(user);
            
            log.info("channel = {}", channel);
            model.addAttribute("channel", channel);
            Long channelId = channel.getChannelId();


            ChatRoom room = chatSvc.findRoomById(channelId);

            log.info("room = {}", room);
            model.addAttribute("room", room);

            // 스트리머의 스트림키를 기반으로 스트리밍 URL 생성
            String streamingKey = user.getStreamingKey(); // 스트리머의 스트리밍 키를 가져온다.
            String streamingUrl = String.format("http://192.168.20.25:8088/stream/hls/%s.m3u8", streamingKey); // 스트리밍 URL 동적 생성
            model.addAttribute("streamingUrl", streamingUrl);

            // TODO: 브로드캐스트 상태를 온으로 만들고 팔로워에게 알림을 보내도록

            String status = channel.getStatus().toString();
            model.addAttribute("status", status);

            return "/channel";
        }
        return "/";
    }

    @PostMapping("/off")
    public String broadcastOff() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Account user = userSvc.loginUser(username);

        Channel channel = channelSvc.findChannelByAccount(user);
        channel.setStatus(Broadcast.OFF);
        channelSvc.save(channel);

        return "redirect:/";
    }
}
