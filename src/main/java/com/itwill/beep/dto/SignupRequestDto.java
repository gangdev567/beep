package com.itwill.beep.dto;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.itwill.beep.domain.Account;

import lombok.Data;

@Data
public class SignupRequestDto {
    
    private String username;
    private String password;
    private String nickname;
    private String email;
    
    public Account toEntity(PasswordEncoder pse) {
        return Account.builder()
                .username(username)
                .user_password(pse.encode(password))
                .userNickname(nickname)
                .email(email)
                .build();
    }

}
