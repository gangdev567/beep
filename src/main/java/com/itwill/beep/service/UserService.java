package com.itwill.beep.service;

import java.util.Optional;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.itwill.beep.domain.UserAccount;
import com.itwill.beep.domain.UserAccountRepository;
import com.itwill.beep.domain.UserRole;
import com.itwill.beep.dto.SignupRequestDto;
import com.itwill.beep.dto.UserSecurityDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {

    private final PasswordEncoder passwordEncoder;
    private final UserAccountRepository userAccountRepository;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        log.info("username = {}", userName);

        UserAccount userAccount = userAccountRepository.findByUserName(userName);
        if (userAccount != null) {
            return UserSecurityDto.fromEntityToDto(userAccount);
        } else {
            throw new UsernameNotFoundException(userName + "찾을 수 없음!");
        }
    }

    public void createUserAccount(SignupRequestDto signupRequestDto) {

        // dto를 Account객체로
        UserAccount userEntity = signupRequestDto.toEntity(passwordEncoder);

        // 역할설정
        userEntity.addUserRole(UserRole.USER);

        // insert users, user_roles
        userAccountRepository.save(userEntity);
    }

    public UserAccount findUserByUserName(String userName) {

        // repository에서 쿼리를 실행
        UserAccount userAccount = userAccountRepository.findByUserName(userName);

        return userAccount;
    }
  
    public UserAccount findUserByUserNickname(String userNickname) {

        UserAccount userAccount = userAccountRepository.findByUserNickname(userNickname);
        
        return userAccount;
    }
    

    /* follow 기능에 필요한 메서드 */
    public UserAccount findByUserId(Long userId) {
        UserAccount userAccount = userAccountRepository.findByUserId(userId);

        return userAccount;
    }
}
