package com.itwill.beep.web;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.service.SseService;
import com.itwill.beep.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RestController
@RequiredArgsConstructor
@Slf4j
public class SseController {
    private final SseService sseService;
    private final UserService userService;
    public static Map<Long, SseEmitter> sseEmitters = new ConcurrentHashMap<>();

    @GetMapping("/connect")
    public ResponseEntity<SseEmitter> notification() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        if(!userName.equals("anonymousUser")) {
            
            UserAccountEntity user = userService.findUserByUserName(userName);
            Long userId = user.getUserId();
            SseEmitter sseEmitter = sseService.connect(userId);
            
            return ResponseEntity.ok(sseEmitter);
        } else {            
            return null;
        }
    }
}
