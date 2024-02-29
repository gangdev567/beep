package com.itwill.beep.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.web.SseController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;

@Service
@RequiredArgsConstructor
@Slf4j
public class SseService {
    
    private final ChannelService channelService;
    
    public SseEmitter connect(Long userId) {
        
        SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE); 
        
        try {
            sseEmitter.send(SseEmitter.event()
                        .name("connect")
                        .data("connect!"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // map에 저장
        SseController.sseEmitters.put(userId, sseEmitter);
        int size = SseController.sseEmitters.size();
        log.info("접속자 수 = {}", size);
        
        sseEmitter.onCompletion(() -> SseController.sseEmitters.remove(userId));   // sseEmitter 연결이 완료될 경우
        sseEmitter.onTimeout(() -> SseController.sseEmitters.remove(userId));      // sseEmitter 연결에 타임아웃이 발생할 경우
        sseEmitter.onError((e) -> SseController.sseEmitters.remove(userId));
        
        return sseEmitter;
    }
    
    public void notification(UserAccountEntity user, List<Long> followersId) {
        
        ChannelEntity channel = channelService.findChannelByUserAccount(user);
        
        for(Long followerId : followersId) {
            if (SseController.sseEmitters.containsKey(followerId)) {       
                log.info("followerId = {}", followerId);
                SseEmitter sseEmitterReceiver = SseController.sseEmitters.get(followerId);
                // 8. 알림 메시지 전송 및 해체
                try {
                    
                    // 방송 정보를 json형식으로 전달.
                    JSONObject data = new JSONObject();
                    data.put("profileImageUrl", channel.getChannelProfileImg());
                    data.put("title", channel.getChannelTitle());
                    data.put("streamer", user.getUserNickname());
                    
                    sseEmitterReceiver.send(SseEmitter.event()
                                                .name("broadcast_on")
                                                .data(data));
                    log.info("sse = {}", sseEmitterReceiver);
                } catch (Exception e) {
                    SseController.sseEmitters.remove(followerId);
                }
            }            
        }
        
    }

}
