package com.itwill.beep.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.UserRole;

public class UserSecurityDto extends User { // 로그인한 이용자의 인증정보를 가지고 UserDetais를 implements 하는 클래스 User
    
    private String userNickname;
    private String email;

    public UserSecurityDto(String username, String password, String userNickname, String email,
            // GrantedAuthority 클래스를 extends 하는 모든 클래스를 Collection(List와 Set의 상위클래스)한다. ? <- 와일드카드 
            Collection<? extends GrantedAuthority> authorities ) {
            
        super(username, password, authorities);
        
        this.userNickname = userNickname;
        this.email = email;
        // TODO Auto-generated constructor stub
    }
    
    public static UserSecurityDto fromEntity(Account entity) {
        
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : entity.getRoles()) {
            SimpleGrantedAuthority auth = new SimpleGrantedAuthority(role.getAuthority());
            authorities.add(auth);
        }
        
        return new UserSecurityDto(entity.getUsername(), entity.getUser_password(), 
                entity.getUserNickname(), entity.getEmail(), authorities);
    }

}
