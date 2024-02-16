package com.itwill.beep.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.ChatState;
import com.itwill.beep.service.ChannelService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/chat")
@RequiredArgsConstructor
public class ChatRestController {

    private final ChannelService channelService;
    
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
}
