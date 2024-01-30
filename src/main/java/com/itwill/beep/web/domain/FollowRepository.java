package com.itwill.beep.web.domain;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FollowRepository extends JpaRepository<Follow, Long> {
    // Long countByToUser(User toUser);
    //
    // Long countByFromUser(User fromUser);
    //
    // List<Follow> findByFromUser(User fromUser);
    //
    // List<Follow> findByToUser(User toUser);
    //
    // void deleteFollowByFromUser(User fromUser);
    //
    // @Query("select f from Follow f where f.fromUser = :from and f.toUser = :to")
    // Optional<Follow> findFollow(@Param("from") User fromUser, @Param("to") User toUser);
}
