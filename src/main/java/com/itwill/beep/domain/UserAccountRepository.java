package com.itwill.beep.domain;

import java.util.Optional;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserAccountRepository extends JpaRepository<UserAccount, Long> {

    @EntityGraph(attributePaths = "roles")
    UserAccount findByUserName(String userName);

    UserAccount findByUserNickname(String userNickname);

    /* follow 기능에 필요한 메서드 */
    UserAccount findByUserId(Long userId);

    UserAccount findByUserStreamingKey(String userStreamingKey);

}
