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
import com.itwill.beep.domain.Broadcast;
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
    public String broadcastOn(Model model) {
        
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
            // 방송 ON
            channel.setStatus(Broadcast.ON);
            channelSvc.save(channel);
            log.info("channel = {}", channel);
            model.addAttribute("channel", channel);
            Long channelId = channel.getChannelId();
            
            Long viewers = (long) 0;
            
            String nickName = user.getUserNickname();
            ChatRoom room = chatSvc.createRoom(nickName, channelId, viewers);
            log.info("room = {}", room);
            model.addAttribute("room", room);
            
            // TODO: 브로드캐스트 상태를 온으로 만들고 팔로워에게 알림을 보내도록
            
            // channel.status는 Set타입 객체다 그래서인지 th:if 조건문에서 계속 실패했다. 
            // 타임리프로 해결하는 방안이 있을 것이라고 생각은 하지만 공식문서를 뒤져봐도 해결법은 찾지 못했다.
            // 그래서 그냥 컨트롤러 부분에서 문자열로 변환하여 보내기로 했다.
            String status = channel.getStatus().toString();
            model.addAttribute("status", status);
            
            return "/channel";
        }
        return "/";
    }
    
    @PostMapping("/off")
    public String broadcastOff() {
        
        // 로그인한 유저 정보를 불러온다.
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        // 유저 정보에서 유저의 아이디를 불러온다.
        String username = authentication.getName();
        
        Account user = userSvc.loginUser(username);
        
        Channel channel = channelSvc.findChannelByAccount(user);
        
        channel.setStatus(Broadcast.OFF);
        
        channelSvc.save(channel);
        
        return "redirect:/";
    }
    
}
