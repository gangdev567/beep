package com.itwill.beep.service;

import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.domain.VerificationToken;
import com.itwill.beep.domain.VerificationTokenRepository;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class VerificationTokenService {

    private final VerificationTokenRepository tokenRepository;

    public String createVerificationToken(UserAccountEntity user) {
        String token = UUID.randomUUID().toString();
        VerificationToken myToken = new VerificationToken(token, user);
        tokenRepository.save(myToken);
        return token;
    }

    public VerificationToken getVerificationToken(String VerificationToken) {
        return tokenRepository.findByVerifiTokenValue(VerificationToken);
    }

    // ... 이메일 전송 및 토큰 검증 로직 ...
}