package com.itwill.beep.domain;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FollowRepository extends JpaRepository<FollowEntity, Long> {
    void deleteByFollowerUserAccountAndFollowingUserAccount
        (UserAccountEntity followerUserAccount, UserAccountEntity followingUserAccount);

    Long countByFollowerUserAccount(UserAccountEntity followerUserAccount);

    Long countByFollowingUserAccount(UserAccountEntity followingUserAccount);

    List<FollowEntity> findByFollowerUserAccount(UserAccountEntity followerUserAccount);

    FollowEntity findByFollowerUserAccountAndFollowingUserAccount(UserAccountEntity followerUserAccount, UserAccountEntity followingUserAccount);

    boolean existsByFollowerUserAccountAndFollowingUserAccount(UserAccountEntity followerUserAccount, UserAccountEntity followingUserAccount);

    List<FollowEntity> findByFollowingUserAccount(UserAccountEntity followingUserAccount);

}
