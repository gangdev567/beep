package com.itwill.beep.config;

import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.itwill.beep.listener.UserCountListener;

@Configuration
//리스너의 설정을 하는 클래스
public class ListenerConfig {

    // 아무튼 대충 빈을 이용해 객체로 만들어야 스프링 컨테이너가 이러쿵 저러쿵 할 수 있음
    @Bean
    public ServletListenerRegistrationBean<UserCountListener> listenerRegistrationBean() {
        ServletListenerRegistrationBean<UserCountListener> bean =
                new ServletListenerRegistrationBean<>(new UserCountListener());
        return bean;
    }
}
