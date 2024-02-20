package com.itwill.beep.web;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.ChatState;
import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.dto.ChatStateAndUserTypeDto;
import com.itwill.beep.service.BannedUserService;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.FollowService;
import com.itwill.beep.service.ManagerService;
import com.itwill.beep.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/chat")
@RequiredArgsConstructor
public class ChatRestController {

    private final ChannelService channelService;
    private final UserService userService;
    private final FollowService followService;
    private final BannedUserService banService;
    private final ManagerService managerService;
    
    @PostMapping("/follow/{channelId}")
    public ResponseEntity<Boolean> followChat(@PathVariable("channelId") Long channelId) {
        
        ChannelEntity channel = channelService.findChannelById(channelId);
        
        channel.setChatState(ChatState.FOLLOW);
        channelService.save(channel);
        
        log.info("channel = {}" , channel);
        
        
        return ResponseEntity.ok(true);
    }
    
    @PostMapping("/anonymous/{channelId}")
    public ResponseEntity<Boolean> anonChat(@PathVariable("channelId") Long channelId) {
        
        ChannelEntity channel = channelService.findChannelById(channelId);
        
        channel.setChatState(ChatState.ANONYMOUS);
        channelService.save(channel);
        
        return ResponseEntity.ok(true);
    }
    
    @PostMapping("/ice/{channelId}")
    public ResponseEntity<Boolean> iceChat(@PathVariable("channelId") Long channelId) {
        
        ChannelEntity channel = channelService.findChannelById(channelId);
        
        channel.setChatState(ChatState.STREAMER_ONLY);
        channelService.save(channel);
        
        return ResponseEntity.ok(true);
    }
    
    @PostMapping("/default/{channelId}")
    public ResponseEntity<Boolean> defaultChat(@PathVariable("channelId") Long channelId) {
        
        ChannelEntity channel = channelService.findChannelById(channelId);
        
        channel.setChatState(ChatState.DEFAULT);
        channelService.save(channel);
        
        return ResponseEntity.ok(true);
    }
    
    @GetMapping("/chatState/{channelId}")
    public ResponseEntity<ChatStateAndUserTypeDto> chatState(@PathVariable("channelId") Long channelId) {
        
        if (SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") { 
            
            String userType = "";
            
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            
            String username = authentication.getName();
            
            UserAccountEntity user = userService.findUserByUserName(username);

            ChannelEntity channel = channelService.findChannelById(channelId);
            
            UserAccountEntity streamer = channelService.findUserByChannelId(channelId);
            
            boolean followCheck = followService.isFollowing(user, streamer);
            
            boolean banCheck = banService.isBan(user, channel);
            
            boolean managerCheck = managerService.isManager(user, channel);
            
            if (user.getUserId() == channel.getChannelUserAccountEntity().getUserId()){
                userType = "STREAMER";
            } else if(managerCheck == true) {
                userType = "MANAGER";
            } else if(banCheck == true) {
                userType = "BAN";
            } else if(followCheck == true) {
                userType = "FOLLOW";
            } else if(followCheck == false){
                userType = "NON_FOLLOW";
            }
            
            String chatState = channel.getChatStateSet().toString();
            
            ChatStateAndUserTypeDto dto = new ChatStateAndUserTypeDto();
            dto.setChatState(chatState);
            dto.setUserType(userType);
            
            return ResponseEntity.ok(dto);
        } else {
            ChannelEntity channel = channelService.findChannelById(channelId);
            String chatState = channel.getChatStateSet().toString();
            
            ChatStateAndUserTypeDto dto = new ChatStateAndUserTypeDto();
            dto.setChatState(chatState);
            dto.setUserType("anonymousUser");
            
            return ResponseEntity.ok(dto);
        }
    }
}
