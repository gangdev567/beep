package com.itwill.beep.web;

import com.itwill.beep.dto.UserSecurityDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Slf4j
@Controller
public class DashboardController {


    // 사용자 대시보드 홈으로 이동하는 메소드, URL 경로에 userId 포함
    @GetMapping("/user/dashboard/{userId}/home")
    public String userDashboardHome(@PathVariable("userId") String userId, Authentication authentication, Model model) {
        log.info("대시보드 접속: 사용자 ID = {}", userId);

        // Authentication 객체에서 UserDetails 추출
        UserSecurityDto userDetails = (UserSecurityDto) authentication.getPrincipal();

        // URL에서 받아온 userId와 인증된 사용자의 ID가 일치하는지 검증
        if (!userDetails.getUsername().equals(userId)) {
            log.warn("접근 시도된 userId {} 와 인증된 사용자의 userId {} 가 일치하지 않습니다.", userId, userDetails.getUsername());
            // 사용자 ID가 일치하지 않을 경우 홈페이지로 리다이렉트
            return "redirect:/";
        }

        // UserDetails 정보를 모델에 추가.
        model.addAttribute("user", userDetails);

        // 대시보드 홈 페이지로 이동
        return "user/dashboard/home"; // Thymeleaf 경로 수정 필요
    }
}