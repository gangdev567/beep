package com.itwill.beep.web;

import com.itwill.beep.service.StreamingService;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/streaming")
@RequiredArgsConstructor
public class StreamingController {

    private final StreamingService streamingService;

    // 스트리밍 키 발급 요청 처리
    @GetMapping("/generateKey")
    public ResponseEntity<?> generateStreamingKey(Authentication authentication) {
        String username = authentication.getName();
        String streamingKey = streamingService.generateStreamingKey(username);

        // 로그 추가: 스트리밍 키 발급 로그
        log.info("스트리밍 키를 발급받았습니다. Username: {}, StreamingKey: {}", username, streamingKey);

        return ResponseEntity.ok().body(Map.of("streamingKey", streamingKey));
    }

    @PostMapping("/validateKey")
    public ResponseEntity<?> validateStreamingKey(@RequestBody Map<String, String> payload) {
        log.info("Received streaming key validation request: {}", payload);
        String streamingKey = payload.get("streamingKey");
        boolean isValid = streamingService.validateStreamingKey(streamingKey);
        if (isValid) {
            // 로그 추가: 스트리밍 키 유효성 검사 성공 로그
            log.info("스트리밍 키 유효성 검사가 성공했습니다. StreamingKey: {}", streamingKey);

            return ResponseEntity.ok().build();
        } else {
            // 로그 추가: 스트리밍 키 유효성 검사 실패 로그
            log.warn("스트리밍 키 유효성 검사가 실패했습니다. StreamingKey: {}", streamingKey);

            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }
}