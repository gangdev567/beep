package com.itwill.beep.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.itwill.beep.web.SseController;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SseService {
    
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
        
        sseEmitter.onCompletion(() -> SseController.sseEmitters.remove(userId));   // sseEmitter 연결이 완료될 경우
        sseEmitter.onTimeout(() -> SseController.sseEmitters.remove(userId));      // sseEmitter 연결에 타임아웃이 발생할 경우
        sseEmitter.onError((e) -> SseController.sseEmitters.remove(userId));
        
        return sseEmitter;
    }
    
    public int notification(String StreamerNickname, List<Long> followersId) {
        
        int no = 0;
        
        for(Long followerId : followersId) {
            if (SseController.sseEmitters.containsKey(followerId)) {       
                log.info("followerId = {}", followerId);
                SseEmitter sseEmitterReceiver = SseController.sseEmitters.get(followerId);
                no++;
                // 8. 알림 메시지 전송 및 해체
                try {
                    sseEmitterReceiver.send(SseEmitter.event().name("broadcast_on").data(StreamerNickname + "님이 방송을 시작했습니다."));
                    log.info("sse = {}", sseEmitterReceiver);
                } catch (Exception e) {
                    SseController.sseEmitters.remove(followerId);
                }
            }            
        }
        
        return no;
        // Map 에서 userId 로 사용자 검색
    }

}
