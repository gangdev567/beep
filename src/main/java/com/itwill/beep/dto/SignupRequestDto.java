package com.itwill.beep.dto;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.itwill.beep.domain.UserAccount;

import lombok.Data;

@Data
public class SignupRequestDto {
    
    private String userName;
    private String userPassword;
    private String userNickname;
    private String userEmail;
    
    public UserAccount toEntity(PasswordEncoder passwordEncoder) {
        return UserAccount.builder()
                .userName(userName)
                .userPassword(passwordEncoder.encode(userPassword))
                .userNickname(userNickname)
                .userEmail(userEmail)
                .build();
    }

}
