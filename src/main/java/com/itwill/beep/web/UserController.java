package com.itwill.beep.web;

import com.itwill.beep.domain.Account;
import com.itwill.beep.dto.UserSecurityDto;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.beep.dto.SignupRequestDto;
import com.itwill.beep.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
    
    private final UserService userSvc;
    
    @GetMapping("/login")
    public void login() {
        log.info("login()");
    }
    
    @GetMapping("/signup")
    public void signin () {
        log.info("signup()");
    }
    
    @PostMapping("/signup")
    public String createAccount(@ModelAttribute SignupRequestDto dto) {
        log.info("dto = {}", dto);
        
        userSvc.createAccount(dto);
        
        // 회원가입 이후 로그인 페이지로
        return "redirect:/user/login";
    }

}   
