package com.itwill.beep.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.itwill.beep.domain.UserAccount;
import com.itwill.beep.domain.UserRole;

@Getter
public class UserSecurityDto extends User {

    // Getter 메소드 추가
    private String userNickname;
    private String userEmail;
    private String userStreamingKey; // streamingKey 필드 추가

    public UserSecurityDto(String userName, String userPassword, String userNickname, String userEmail, String userStreamingKey,
        Collection<? extends GrantedAuthority> userAuthorities) {
        super(userName, userPassword, userAuthorities);
        this.userNickname = userNickname;
        this.userEmail = userEmail;
        this.userStreamingKey = userStreamingKey; // 생성자에 streamingKey 초기화 추가
    }

    // fromEntity 메소드에 streamingKey 추가
    public static UserSecurityDto fromEntityToDto(UserAccount userEntity) {
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : userEntity.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getAuthority()));
        }

        return new UserSecurityDto(userEntity.getUserName(), userEntity.getUserPassword(),
            userEntity.getUserNickname(), userEntity.getUserEmail(), userEntity.getUserStreamingKey(),
            authorities);
    }

}
