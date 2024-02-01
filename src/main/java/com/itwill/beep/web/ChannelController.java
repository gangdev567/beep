package com.itwill.beep.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Channel;
import com.itwill.beep.dto.ChatRoom;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.ChatService;
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
    
    @GetMapping("/channel/{id}")
    public String channel(@PathVariable(name = "id") String id, Model model) {
        log.info("{}의 채널", id);
        // 로그인한 유저 정보를 가지고 있는 클래스에서 username이 anonymousUser(익명)이 아닐경우에
        if(SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {
            
            // 로그인한 유저 정보를 불러온다.
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            
            // 유저 정보에서 유저의 아이디를 불러온다.
            String username = authentication.getName();
            log.info("username = {}", username);
            
            // 유저 아이디로 유저의 상세정보를 불러올 쿼리를 실행한다.
            Account user = userSvc.loginUser(username);
            
            // pathvariable로 스트리머 정보를 가져온다
            Account streamer = userSvc.loadUserByNickname(id);
            log.info("streamer = {}", streamer);
            
            // model에 user를 보낸다.
            model.addAttribute("user", user);
            
            // streamer정보로 channel정보를 불러온다.
            Channel channel = channelSvc.findChannelByAccount(streamer);
            log.info("channel = {}", channel);
            Long channelId = channel.getChannel_id();
            
            // channelId로 room 정보를 찾는다.
            ChatRoom room = chatSvc.findRoomById(channelId);
            log.info("room = {}", room);
            model.addAttribute("room", room);
            
            // TODO: 여기서 만들어져있는 방송으로 이동하는 메서드를 만들어야 함
            
        }
        
        return "/channel";

    }
}
