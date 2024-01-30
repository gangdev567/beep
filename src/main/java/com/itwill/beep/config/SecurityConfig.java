package com.itwill.beep.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration // 설정파일임을 스프링컨테이너에게 알려주는 애너테이션
@EnableMethodSecurity // -> 스프링 세큐리티 메서드 활성화
public class SecurityConfig {

    @Bean // 의존성 주입을 위한 객체설정
    public PasswordEncoder passwordEncodeer() {
        return new BCryptPasswordEncoder();
        // 암호화 메서드
    }
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        
        // -> CSRF(Cross Site Request Forgery) 비활성화
        http.csrf((csrf) -> csrf.disable());
        
        // 로그인 페이지 설정
        http.formLogin((login) -> login.loginPage("/user/login"));
        
        // 로그아웃 이후에 이동할 페이지 설정 - 홈 페이지(/)
        http.logout((logout) -> logout.logoutSuccessUrl("/"));
        
        return http.build();
    }
    
}
