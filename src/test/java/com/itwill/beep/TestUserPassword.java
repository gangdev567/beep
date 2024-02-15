package com.itwill.beep;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.domain.UserAccountRepository;
import com.itwill.beep.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class TestUserPassword {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	 	@Autowired
	    private UserService userService;

	    @Autowired
	    private UserAccountRepository userAccountRepository;

	    @Test
	    void testLoadUserByUsername_UserExists() {
	        // Given
	        String username = "a";
	        
	        // When
	        UserDetails userDetails = userService.loadUserByUsername(username);
	        log.info("userDetails={}",userDetails);

	        // Then
	        assertEquals(username, userDetails.getUsername());
	        log.info("사용자 '{}'가 존재합니다.", username);
	    }

//	    @Test
//	    void testLoadUserByUsername_UserNotExists() {
//	        // Given
//	        String nonExistingUsername = "nonexistent";
//
//	        // When, Then
//	        UsernameNotFoundException exception = assertThrows(UsernameNotFoundException.class, () -> userService.loadUserByUsername(nonExistingUsername));
//
//	        // Then
//	        log.info("사용자 '{}'는 존재하지 않습니다.", nonExistingUsername);
//	        assertEquals(nonExistingUsername + "찾을 수 없음!", exception.getMessage());
//	    }
	}
	
	





	
	
	


