package com.itwill.beep.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwill.beep.domain.Account;
import com.itwill.beep.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
    
    private final UserService userSvc;

    @GetMapping("/")
    @PreAuthorize("permitAll")
    public String home(Model model) {
        
        // 로그인한 유저 정보를 가지고 있는 클래스에서 username이 anonymousUser(익명)이 아닐경우에
        if(SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {
            
            // 로그인한 유저 정보를 불러온다.
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            
            // 유저 정보에서 유저의 아이디를 불러온다.
            String username = authentication.getName();
            log.info("username = {}", username);
            
            // 유저 아이디로 유저의 상세정보를 불러올 쿼리를 실행한다.
            Account user = userSvc.loginUser(username);
            
            // model에 user를 보낸다.
            model.addAttribute("user", user);
            
        }
        return "home";
    }

}
