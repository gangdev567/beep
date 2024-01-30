package com.itwill.beep.listener;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import lombok.extern.slf4j.Slf4j;

@Slf4j
// 세션에 접속한 접속자 숫자를 구하기 위한 클래스
public class UserCountListener implements HttpSessionListener {

    private static int count = 0;
    
    public static int getCount() {
        return count;
    }
    
    @Override
    public void sessionCreated(HttpSessionEvent e) {
        HttpSession session = e.getSession();
        count ++;
        log.info("session = {}, count = {}", session.getId(), count);
    }
    
    public void sessionDestroyed(HttpSessionEvent e) {
        count --;
        if(count < 0 ) {
            count = 0;
        }
        HttpSession session = e.getSession();
        log.info("session = {}, count = {}", session.getId(), count);
    }
}
