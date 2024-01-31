package com.itwill.beep;

import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.Assertions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Follow;
import com.itwill.beep.service.FollowService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class FollowTest {

    @Autowired
    private FollowService followService;

    // @Test
    public void test() {
        log.info("test()");

        long countByFromUser = followService.countByFromUser(Account.builder().id(22L).build());
        Long countFollowersByToUser =
                followService.countFollowersByToUser(Account.builder().id(21L).build());
        List<Follow> findByFromUser =
                followService.findByFromUser(Account.builder().id(22L).build());
        Optional<Follow> findFollow = followService.findFollow(Account.builder().id(22L).build(),
                Account.builder().id(21L).build());

        Assertions.assertNotNull(countByFromUser);
        log.info("countByFromUser : {}", countByFromUser);
        Assertions.assertNotNull(countFollowersByToUser);
        log.info("countFollowersByToUser : {}", countFollowersByToUser);
        Assertions.assertNotNull(findByFromUser);
        log.info("findByFromUser : {}", findByFromUser.get(0).toString());
        Assertions.assertNotNull(findFollow);
        log.info("findFollow : {}", findFollow.get().toString());

    }

}
