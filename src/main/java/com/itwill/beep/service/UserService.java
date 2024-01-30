package com.itwill.beep.service;

import java.util.Optional;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.AccountRepository;
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
    private final AccountRepository AccDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("username = {}", username);

        Optional<Account> opt = AccDao.findByUsername(username);
        if (opt.isPresent()) {
            return UserSecurityDto.fromEntity(opt.get());
        } else {
            throw new UsernameNotFoundException(username + "찾을 수 없음!");
        }

    }

    public void createAccount(SignupRequestDto dto) {

        // dto를 Account객체로
        Account entity = dto.toEntity(passwordEncoder);

        // 역할설정
        entity.addRole(UserRole.USER);

        // insert users, user_roles
        AccDao.save(entity);
    }

    public Account loginUser(String username) {

        // repository에서 쿼리를 실행
        Account user = AccDao.findByUsernameIs(username);

        return user;
    }

    /* follow 기능에 필요한 메서드 */
    public Account findByUserId(Long id) {
        Account user = AccDao.findByIdIs(id);

        return user;
    }
}
