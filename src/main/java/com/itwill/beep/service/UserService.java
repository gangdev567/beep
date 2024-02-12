package com.itwill.beep.service;

import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.domain.UserRoleType;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.itwill.beep.domain.UserAccountRepository;
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

        UserAccountEntity userAccountEntity = userAccountRepository.findByUserName(userName);
        if (userAccountEntity != null) {
            return UserSecurityDto.fromEntityToDto(userAccountEntity);
        } else {
            throw new UsernameNotFoundException(userName + "찾을 수 없음!");
        }
    }

    public void createUserAccount(SignupRequestDto signupRequestDto) {

        // dto를 Account객체로
        UserAccountEntity userEntity = signupRequestDto.toEntity(passwordEncoder);

        // 역할설정
        userEntity.addUserRole(UserRoleType.USER);

        // insert users, user_roles
        userAccountRepository.save(userEntity);
    }

    public UserAccountEntity findUserByUserName(String userName) {

        // repository에서 쿼리를 실행
        UserAccountEntity userAccountEntity = userAccountRepository.findByUserName(userName);

        return userAccountEntity;
    }
  
    public UserAccountEntity findUserByUserNickname(String userNickname) {

        UserAccountEntity userAccountEntity = userAccountRepository.findByUserNickname(userNickname);
        
        return userAccountEntity;
    }
    

    /* follow 기능에 필요한 메서드 */
    public UserAccountEntity findByUserId(Long userId) {
        UserAccountEntity userAccountEntity = userAccountRepository.findByUserId(userId);

        return userAccountEntity;
    }
}
