package com.itwill.beep.domain;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FollowRepository extends JpaRepository<Follow, Long> {
    Long countByFromUser(Account fromUser);

    List<Follow> findByFromUser(Account fromUser);

    void deleteFollowByFromUser(Account fromUser);

    Optional<Follow> findByFromUserAndToUser(Account fromUser, Account toUser);

}
