package com.itwill.beep.web;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.beep.domain.UserAccountEntity;
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
    
    @GetMapping("/login")
    public void userLogin() {
        log.info("userLogin()");
    }
    
    @GetMapping("/signup")
    public void userSignin () {
        log.info("userSignup()");
    }
    
    @PostMapping("/signup")
    public String createUserAccount(@ModelAttribute SignupRequestDto signupRequestDto) {
        log.info("signupRequestDto = {}", signupRequestDto);
        
        userService.createUserAccount(signupRequestDto);
        
        // 회원가입 이후 로그인 페이지로
        return "redirect:/user/login";
    }
    
    /**
     * 회원가입 유효성 검사
     * 회원 가입 시, 클라이언트로부터 전달된 사용자 아이디(username)의 중복 여부를 확인하는 엔드포인트.
     * @param username 클라이언트가 전달한 사용자 아이디
     * @return 이미 존재하는 경우 "Y", 존재하지 않는 경우 "N"을 반환하는 ResponseEntity
     */
    @GetMapping("/signup/checkusername")
    @ResponseBody
    public ResponseEntity<String> checkUsername(@RequestParam(name = "username") String username) {
        // 현재 메서드의 실행 로그.
        log.debug("checkusername(username={})", username);

        // UserService를 통해 전달된 사용자 아이디가 이미 존재하는지 확인.
        boolean isUserIdExists = userService.isUserNameExists(username);
        
        // 현재 확인하고 있는 사용자 아이디 로그.
        log.info(username);

        // 존재하는 경우 "Y"를 반환.
        // 존재하지 않는 경우 "N"을 반환.
        return isUserIdExists
                ? ResponseEntity.ok("Y") // 아이디가 이미 존재하는 경우
                : ResponseEntity.ok("N"); // 아이디가 존재하지 않는 경우
    }
}
