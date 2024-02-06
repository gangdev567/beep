package com.itwill.beep.service;

import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.AccountRepository;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class StreamingService {

    private final AccountRepository accountRepository;

    public String generateStreamingKey(String username) {
        try {
            Account account = accountRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

            String streamingKey = UUID.randomUUID().toString();
            account.updateStreamingKey(streamingKey); // updateStreamingKey 메서드를 사용하여 streamingKey 설정
            accountRepository.save(account);

            log.info("Streaming key generated for user: {}", username);
            return streamingKey;
        } catch (Exception e) {
            log.error("Error generat1ing streaming key for user: {}", username, e);
            throw e; // 예외 다시 던지기
        }
    }

    public boolean validateStreamingKey(String streamingKey) {
        try {
            boolean valid = accountRepository.findByStreamingKey(streamingKey).isPresent();
            log.info("Validating streaming key: {} - Result: {}", streamingKey, valid);
            return valid;
        } catch (Exception e) {
            log.error("Error validating streaming key: {}", streamingKey, e);
            throw e; // 예외 다시 던지기
        }
    }
}