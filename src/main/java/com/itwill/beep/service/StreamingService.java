package com.itwill.beep.service;

import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.domain.UserAccountRepository;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class StreamingService {

    private final UserAccountRepository userAccountRepository;

    public String generateStreamingKey() {
        // 단순히 UUID를 기반으로 streamingKey 생성
        return UUID.randomUUID().toString();
    }

    public boolean validateStreamingKey(String streamingKey) {
        try {
            boolean streamingKeyValid = (userAccountRepository.findByUserStreamingKey(streamingKey) !=null);
            log.info("Validating streaming key: {} - Result: {}", streamingKey, streamingKeyValid);
            return streamingKeyValid;
        } catch (Exception e) {
            log.error("Error validating streaming key: {}", streamingKey, e);
            throw e; // 예외 다시 던지기
        }
    }
}