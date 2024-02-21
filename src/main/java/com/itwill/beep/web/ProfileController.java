package com.itwill.beep.web;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.domain.UserAccountRepository;
import com.itwill.beep.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/settings")
public class ProfileController {

    private final UserService userService;
    private final UserAccountRepository userAccountRepository;

    @GetMapping("/profile")
    public String profileSettings(@AuthenticationPrincipal UserDetails currentUser, Model model) {
        // 사용자 정보 로드 로직 (인증 로직에 따라 달라질 수 있음)
        UserAccountEntity user = userAccountRepository.findByUserName(currentUser.getUsername());
        model.addAttribute("currentUsername", currentUser.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("active", "profile"); // 현재 활성화된 섹션을 모델에 추가
        return "settings/profile";
    }

    @PostMapping("/profile")
    public String updateProfile(@RequestParam("username") String username,
        @RequestParam("nickname") String nickname,
        @RequestParam("selfIntroduction") String selfIntroduction,// 이메일 인증 로직 필요
        Model model) {
        // 프로필 업데이트 로직
        userService.updateProfile(username, nickname, selfIntroduction);
        return "redirect:/settings/profile?success";
    }

    @PostMapping("/profile/updateUsername")
    public String updateUsername(@AuthenticationPrincipal UserDetails userDetails,
        @RequestParam("newUsername") String newUsername, HttpServletRequest request) {

        // 현재 로그인한 사용자의 이메일 인증 상태를 확인
        boolean isEmailVerified = userService.checkIfUserEmailVerified(userDetails.getUsername());

        if (!isEmailVerified) {
            // 이메일이 인증되지 않았다면, 에러 메시지와 함께 리다이렉트
            return "redirect:/settings/profile?error=email-not-verified";
        }

        // 이메일 인증이 확인된 경우, 아이디 변경 처리
        userService.updateUsername(userDetails.getUsername(), newUsername);

        // 현재 사용자의 Authentication 객체 업데이트
        Authentication authentication = new UsernamePasswordAuthenticationToken(newUsername, userDetails.getPassword(), userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // 세션에 변경된 사용자 이름 적용
        HttpSession session = request.getSession(true);
        session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());

        return "redirect:/logout";
    }

    // "/profile/security" 경로로 요청이 오면 이 메소드가 처리합니다.
    @GetMapping("/security")
    public String securitySettings(Authentication authentication, Model model) {
        String userName = authentication.getName(); // 현재 인증된 사용자의 이메일(Username)을 가져옵니다.

        // 이메일을 사용하여 사용자 정보를 조회합니다.
        UserAccountEntity currentUser = userAccountRepository.findByUserName(userName);

        // Model 객체에 현재 사용자 정보와 활성 탭을 추가합니다.
        model.addAttribute("user", currentUser);
        model.addAttribute("active", "security"); // 활성 탭을 표시하기 위한 속성

        // "settings/security" 뷰를 반환합니다. (HTML 파일 이름이 "settings/security.html" 이라고 가정)
        return "settings/security";
    }
}
