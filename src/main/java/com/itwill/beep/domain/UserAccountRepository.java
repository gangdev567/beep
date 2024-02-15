package com.itwill.beep.domain;

import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserAccountRepository extends JpaRepository<UserAccountEntity, Long> {

    // 해당 사용자 이름을 갖는 UserAccountEntity를 가져오며, 연관된 userRoles를 함께 로딩.
    @EntityGraph(attributePaths = "userRoles")
    UserAccountEntity findByUserName(String userName);

    // 해당 사용자 별명을 갖는 UserAccountEntity를 가져옴.
    UserAccountEntity findByUserNickname(String userNickname);

    /* follow 기능에 필요한 메서드 */

    // 해당 userId와 일치하는 UserAccountEntity를 가져옴.
    UserAccountEntity findByUserId(Long userId);

    // 해당 userStreamingKey와 일치하는 UserAccountEntity를 가져옴.
    UserAccountEntity findByUserStreamingKey(String userStreamingKey);
    
    // 해당 사용자 이름이 존재하는지 확인.
    boolean existsByUserName(String userName);
    
    /**
     * 사용자 아이디로 비밀번호를 변경하는 메소드.
     *
     * @param username      변경할 사용자의 아이디
     * @param newPassword   새로운 비밀번호
     * @return 변경된 사용자 엔터티의 개수
     */
    @Modifying
    @Query("UPDATE USER_ACCOUNTS u SET u.userPassword = :newPassword WHERE u.userName = :username")
    int changePasswordByUsername(@Param("username") String username, @Param("newPassword") String newPassword);


    
}
