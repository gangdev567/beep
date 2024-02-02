package com.itwill.beep.domain;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FollowRepository extends JpaRepository<Follow, Long> {
    void deleteByFromUserNoAndToUserNo(Account fromUserNo, Account toUserNo);

    Long countByFromUserNo(Account fromUserNo);

    Long countByToUserNo(Account toUserNo);

    List<Follow> findByFromUserNo(Account fromUserNo);

    Optional<Follow> findByFromUserNoAndToUserNo(Account fromUserNo, Account toUserNo);

    boolean existsByFromUserNoAndToUserNo(Account fromUser, Account toUser);

    List<Follow> findByToUserNo(Account toUserNo);

}
