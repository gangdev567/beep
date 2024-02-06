package com.itwill.beep.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.UserRole;

public class UserSecurityDto extends User {

    private String userNickname;
    private String email;
    private String streamingKey; // streamingKey 필드 추가

    public UserSecurityDto(String username, String password, String userNickname, String email, String streamingKey,
        Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.userNickname = userNickname;
        this.email = email;
        this.streamingKey = streamingKey; // 생성자에 streamingKey 초기화 추가
    }

    // fromEntity 메소드에 streamingKey 추가
    public static UserSecurityDto fromEntity(Account entity) {
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : entity.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getAuthority()));
        }

        return new UserSecurityDto(entity.getUsername(), entity.getUser_password(),
            entity.getUserNickname(), entity.getEmail(), entity.getStreamingKey(), authorities);
    }

    // Getter 메소드 추가
    public String getUserNickname() {
        return userNickname;
    }

    public String getEmail() {
        return email;
    }

    public String getStreamingKey() {
        return streamingKey;
    }
}
