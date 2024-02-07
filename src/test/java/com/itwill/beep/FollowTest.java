package com.itwill.beep;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Follow;
import com.itwill.beep.service.FollowService;

@Slf4j
@SpringBootTest
public class FollowTest {

    @Autowired
    private FollowService followService;

    /**
     * 시작 조건: fromUser가 toUser를 팔로우하고 있지 않은 상태여야 합니다.
     */
    @Test
    public void testFollowService() {
        log.info("testFollowService()");

        // 테스트에 사용할 사용자 객체 생성 (임의의 값 사용)
        Account fromUser = Account.builder().id(22L).build();
        Account toUser = Account.builder().id(21L).build();

        // 팔로잉 수 확인
        Long countByFromUser = followService.countByFromUser(fromUser);
        Assertions.assertNotNull(countByFromUser);
        log.info("countByFromUser: {}", countByFromUser);

        // 팔로워 수 확인
        Long countFollowersByToUser = followService.countFollowersByToUser(toUser);
        Assertions.assertNotNull(countFollowersByToUser);
        log.info("countFollowersByToUser: {}", countFollowersByToUser);

        // 팔로잉 목록 확인
        List<Follow> followList = followService.findByFromUser(fromUser);
        Assertions.assertNotNull(followList);
        if (!followList.isEmpty()) {
            log.info("findByFromUser: {}", followList.get(0).toString());
        }

        // 팔로잉 여부 확인
        boolean isFollowing = followService.isFollowing(fromUser, toUser);
        log.info("isFollowing: {}", isFollowing);

        // 팔로우
        followService.follow(fromUser, toUser);
        isFollowing = followService.isFollowing(fromUser, toUser);
        Assertions.assertTrue(isFollowing);

        // 언팔로우
        followService.unfollow(fromUser, toUser);
        isFollowing = followService.isFollowing(fromUser, toUser);
        Assertions.assertFalse(isFollowing);

        // 팔로우한 후 팔로워 수 확인
        countFollowersByToUser = followService.countFollowersByToUser(toUser);
        Assertions.assertNotNull(countFollowersByToUser);
        log.info("countFollowersByToUser: {}", countFollowersByToUser);

        // 팔로우한 후 팔로잉 목록 확인
        followList = followService.findByFromUser(fromUser);
        Assertions.assertNotNull(followList);
        if (!followList.isEmpty()) {
            log.info("findByFromUser: {}", followList.get(0).toString());
        }
    }
}
