package com.itwill.beep.domain;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserAccountRepository extends JpaRepository<UserAccountEntity, Long> {

    @EntityGraph(attributePaths = "userRoles")
    UserAccountEntity findByUserName(String userName);

    UserAccountEntity findByUserNickname(String userNickname);

    /* follow 기능에 필요한 메서드 */
    UserAccountEntity findByUserId(Long userId);

    UserAccountEntity findByUserStreamingKey(String userStreamingKey);

    UserAccountEntity findByUserEmail(String email);

}
