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
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
        // 암호화 메서드
    }
    
    // 스프링 시큐리티 필터 체인 객체(bean):
    // 로그인/로그아웃 관련 설정.
    // 로그인 페이지(뷰), 로그아웃 페이지(뷰) 설정.
    // 페이지 접근 권한, 인증 설정.(로그인 없이 접근 가능한 페이지/로그인해야만 접근 가능한 페이지)
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
            .csrf(csrf -> csrf.disable())
            .formLogin(login -> login.loginPage("/user/login"))
            .logout(logout -> logout.logoutSuccessUrl("/"))
            .sessionManagement(management -> management
                .maximumSessions(1) /* session 허용 갯수 */
                .expiredUrl("/user/login") /* session 만료시 이동 페이지*/
                .maxSessionsPreventsLogin(false) /* 동일한 사용자 로그인시 x, false 일 경우 기존 사용자 session 종료*/)
            .build();
    }
}
