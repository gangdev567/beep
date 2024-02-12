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

    public String generateStreamingKey(String userName) {
        try {
            UserAccountEntity userAccountEntity = userAccountRepository.findByUserName(userName);

            String generatedStreamingKey = UUID.randomUUID().toString();
            userAccountEntity.updateUserStreamingKey(generatedStreamingKey); // updateStreamingKey 메서드를 사용하여 streamingKey 설정
            userAccountRepository.save(userAccountEntity);

            log.info("Streaming key generated for user: {}", userName);
            return generatedStreamingKey;
        } catch (Exception e) {
            log.error("Error generat1ing streaming key for user: {}", userName, e);
            throw e; // 예외 다시 던지기
        }
    }

    public boolean validateStreamingKey(String streamingKey) {
        try {
            boolean streamingKeyValid = userAccountRepository.findByUserStreamingKey(streamingKey).isPresent();
            log.info("Validating streaming key: {} - Result: {}", streamingKey, streamingKeyValid);
            return streamingKeyValid;
        } catch (Exception e) {
            log.error("Error validating streaming key: {}", streamingKey, e);
            throw e; // 예외 다시 던지기
        }
    }
}