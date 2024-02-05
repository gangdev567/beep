package com.itwill.beep.web;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Broadcast;
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
public class HomeController {

    private final UserService userSvc;
    private final ChatService chatService;
    private final ChannelService channelSvc;

    @GetMapping("/")
    @PreAuthorize("permitAll")
    public String home(Model model) {

        // 로그인한 유저 정보를 가지고 있는 클래스에서 username이 anonymousUser(익명)이 아닐경우에
        if (SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {

            // 로그인한 유저 정보를 불러온다.
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

            // 유저 정보에서 유저의 아이디를 불러온다.
            String username = authentication.getName();
            log.info("username = {}", username);

            // 유저 아이디로 유저의 상세정보를 불러올 쿼리를 실행한다.
            Account user = userSvc.loginUser(username);

            // model에 user를 보낸다.
            model.addAttribute("user", user);
            
            Channel channel = channelSvc.findChannelByAccount(user);
            log.info("channel = {}", channel);
            model.addAttribute("channel", channel);
            
            // channel.status는 Set타입 객체다 그래서인지 th:if 조건문에서 계속 실패했다. 
            // 타임리프로 해결하는 방안이 있을 것이라고 생각은 하지만 공식문서를 뒤져봐도 해결법은 찾지 못했다.
            // 그래서 그냥 컨트롤러 부분에서 문자열로 변환하여 보내기로 했다.
            String status = channel.getStatus().toString();
            model.addAttribute("status", status);
            
        }
        //현재 진행중인 방송의 리스트를 홈으로 보낸다.
        List<ChatRoom> broadcastList = chatService.findAllRoom();
        
        // 처음에 구조 설계를 잘못잡고 들어가서 chatroom을 따로 만들고 그 정보로 다시 채널 정보를 가져온다.
        // 잘 정리하면 콘트롤러에서 쓰이는 코드가 좀 줄어들 것 같기는 하지만 
        // 여러군데에서 쓸 코드도 아니고 그냥 여기서 한 번 고생했다.
        List<Channel> channelList = broadcastList.stream()
                                        .map(room -> convertToChannel(room))
                                        .filter(channel -> channel.getStatus().contains(Broadcast.ON))
                                        .collect(Collectors.toList());
        
        
        model.addAttribute("channelList",channelList);

        return "home";
    }
    
    private Channel convertToChannel(ChatRoom room) {
        Long channelId = room.getRoomId();
        log.info("channelId = {}", channelId);
        Channel channel = channelSvc.findChannelById(channelId);
        log.info("channel = {}", channel);
        return channel;
    }

}
