package com.itwill.beep.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Channel;
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
    public String createRoom(Model model) {
        
        Authentication authentication1 = SecurityContextHolder.getContext().getAuthentication();
        String username1 = authentication1.getName();
        
        if(SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {
            
            // 로그인한 유저 정보를 불러온다.
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            
            // 유저 정보에서 유저의 아이디를 불러온다.
            String username = authentication.getName();
            log.info("username = {}", username);
            
            // 유저 아이디로 유저의 상세정보를 불러올 쿼리를 실행한다.
            Account user = userSvc.loginUser(username);
            
            // model에 user를 보낸다.
            model.addAttribute("user", user);
            
            // 이 아래는 웹소켓 정보를 만드는 코드
            Channel channel = channelSvc.findChannelByAccount(user);
            log.info("channel = {}", channel);
            Long channelId = channel.getChannel_id();
            
            String nickName = user.getUserNickname();
            ChatRoom room = chatSvc.createRoom(nickName, channelId);
            log.info("room = {}", room);
            model.addAttribute("room", room);
            
            // TODO: 브로드캐스트 상태를 온으로 만들고 팔로워에게 알림을 보내도록
            
        }
        
        return "/channel";
    }
    
}
