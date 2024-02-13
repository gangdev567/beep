package com.itwill.beep.web;

import org.springframework.stereotype.Controller;
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
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserAccountController {
    
    private final UserService userService;
    
    @GetMapping("/user/login")
    public void userLogin() {
        log.info("userLogin()");
    }
    
    @GetMapping("/user/signup")
    public void userSignin () {
        log.info("userSignup()");
    }
    
    @PostMapping("/signup")
    public String createUserAccount(@ModelAttribute SignupRequestDto signupRequestDto) {
        log.info("signupRequestDto = {}", signupRequestDto);
        
        userService.createUserAccount(signupRequestDto);
        
        // 회원가입 이후 로그인 페이지로
        return "redirect:/login";
    }
    
}   
