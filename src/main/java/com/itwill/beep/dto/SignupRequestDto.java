package com.itwill.beep.dto;

import com.itwill.beep.domain.UserAccountEntity;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.Data;

@Data
public class SignupRequestDto {
    
    private String userName;
    private String userPassword;
    private String userNickname;
    private String userEmail;
    
    public UserAccountEntity toEntity(PasswordEncoder passwordEncoder) {
        return UserAccountEntity.builder()
                .userName(userName)
                .userPassword(passwordEncoder.encode(userPassword))
                .userNickname(userNickname)
                .userEmail(userEmail)
                .build();
    }

}
