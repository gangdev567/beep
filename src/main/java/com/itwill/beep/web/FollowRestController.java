package com.itwill.beep.web;

import java.util.HashMap;
import java.util.Map;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.itwill.beep.domain.Account;
import com.itwill.beep.service.FollowService;
import com.itwill.beep.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/follow/")
public class FollowRestController {
    private final FollowService followService;
    private final UserService userService;

    @PostMapping("add/{toUserId}")
    public ResponseEntity<Boolean> follow(@PathVariable("toUserId") Long toUserId) {
        log.info("follow(toUserId: {})", toUserId);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        Account fromUser = userService.loginUser(authentication.getName());
        Account toUser = userService.findByUserId(toUserId);

        followService.follow(fromUser, toUser);
        log.info("{} 님이 {} 님을 팔로우합니다.", fromUser.getUsername(), toUser.getUsername());

        return ResponseEntity.ok(true);
    }

    @DeleteMapping("delete/{toUserId}")
    public ResponseEntity<Boolean> unfollow(@PathVariable("toUserId") Long toUserId) {
        log.info("unfollow(toUserId: {})", toUserId);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        Account loggedInUser = userService.loginUser(authentication.getName());
        Account unfollowUser = userService.findByUserId(toUserId);

        followService.unfollow(loggedInUser, unfollowUser);
        log.info("{} 님이 언팔로우합니다.", loggedInUser.getUsername());

        return ResponseEntity.ok(true);
    }

    @GetMapping("status/{toUserId}")
    public ResponseEntity<Map<String, Boolean>> getFollowStatus(
            @PathVariable("toUserId") Long toUserId) {
        log.info("getFollowStatus(toUserId: {})", toUserId);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Account fromUser = userService.loginUser(authentication.getName());
        Account toUser = userService.findByUserId(toUserId);

        boolean isFollowing = followService.isFollowing(fromUser, toUser);

        Map<String, Boolean> response = new HashMap<>();
        response.put("isFollowing", isFollowing);

        return ResponseEntity.ok(response);
    }

}
