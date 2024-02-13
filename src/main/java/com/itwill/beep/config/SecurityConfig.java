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
    // Spring Security 5 버전부터 비밀번호는 반드시 암호화를 해야 함.
    // 비밀번호를 암호화하지 않으면 HTTP 403(access denied, 접근 거부) 또는
    // HTTP 500 (내부 서버 오류, internal server error) 에러가 발생함.
    // 비밀번호 암호화를 할 수 있는 객체를 스프링 컨테이너가 bean으로 관리해야 함.
    public PasswordEncoder passwordEncodeer() {
        return new BCryptPasswordEncoder();
        // 암호화 메서드
    }
    
    // 스프링 시큐리티 필터 체인 객체(bean):
    // 로그인/로그아웃 관련 설정.
    // 로그인 페이지(뷰), 로그아웃 페이지(뷰) 설정.
    // 페이지 접근 권한, 인증 설정.(로그인 없이 접근 가능한 페이지/로그인해야만 접근 가능한 페이지)
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        
    	// CSRF 기능을 활성화한 경우,
        // Ajax POST/PUT/DELETE 요청에서 csrf 토큰을 서버로 전송하지 않으면 HTTP 403 에러가 발생.
        // -> CSRF(Cross Site Request Forgery) 비활성화
        http.csrf((csrf) -> csrf.disable());
        
        // 로그인 페이지 설정
        http.formLogin((login) -> login.loginPage("/user/login"));
        
        // 로그아웃 이후에 이동할 페이지 설정 - 홈 페이지(/)
        http.logout((logout) -> logout.logoutSuccessUrl("/"));
        
        return http.build();
    }
    
}
