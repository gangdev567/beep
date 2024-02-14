package com.itwill.beep.web;

import java.util.HashMap;
import java.util.List;
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
import com.itwill.beep.domain.FollowEntity;
import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.service.FollowService;
import com.itwill.beep.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/follow")
public class FollowRestController {
    private final FollowService followService;
    private final UserService userService;

    @PostMapping("/add/{following}")
    public ResponseEntity<Boolean> follow(@PathVariable("following") Long following) {
        log.info("follow(following: {})", following);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAccountEntity followerEntity = userService.findUserByUserName(authentication.getName());
        UserAccountEntity followingEntity = userService.findByUserId(following);

        followService.follow(followerEntity, followingEntity);
        log.info("{} 님이 {} 님을 팔로우합니다.", followerEntity.getUserName(),
                followingEntity.getUserName());

        return ResponseEntity.ok(true);
    }

    @DeleteMapping("/delete/{following}")
    public ResponseEntity<Boolean> unfollow(@PathVariable("following") Long following) {
        log.info("unfollow(following: {})", following);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAccountEntity loggedInUser = userService.findUserByUserName(authentication.getName());
        UserAccountEntity unfollowUser = userService.findByUserId(following);

        followService.unfollow(loggedInUser, unfollowUser);
        log.info("{} 님이 언팔로우합니다.", loggedInUser.getUserName());

        return ResponseEntity.ok(true);
    }

    @GetMapping("/status/{following}")
    public ResponseEntity<Map<String, Boolean>> getFollowStatus(
            @PathVariable("following") Long following) {
        log.info("getFollowStatus(following: {})", following);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAccountEntity followerEntity = userService.findUserByUserName(authentication.getName());
        UserAccountEntity followingEntity = userService.findByUserId(following);

        boolean isFollowing = followService.isFollowing(followerEntity, followingEntity);

        Map<String, Boolean> response = new HashMap<>();
        response.put("isFollowing", isFollowing);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/followlist/{follower}")
    public ResponseEntity<Map<String, Object>> getFollowerList(
            @PathVariable("follower") Long follower) {
        log.info("getFollowerList(follower: {})", follower);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAccountEntity followerEntity = userService.findUserByUserName(authentication.getName());
        Long countByfollower = followService.countFollowings(followerEntity);
        List<FollowEntity> followList = followService.getFollowings(followerEntity);

        Map<String, Object> response = new HashMap<>();
        response.put("countByFollow", countByfollower);
        response.put("followList", followList);

        log.info("response: {}", response);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/followerlist/{following}")
    public ResponseEntity<Map<String, Object>> getFollowingCount(
            @PathVariable("following") Long following) {
        log.info("getFollowingCount(following: {})", following);

        UserAccountEntity followingEntity = userService.findByUserId(following);
        Long countFollowerByfollowing = followService.countFollowers(followingEntity);
        List<FollowEntity> followerList = followService.getFollowers(followingEntity);

        Map<String, Object> response = new HashMap<>();
        response.put("countByFollower", countFollowerByfollowing);
        response.put("followerList", followerList);

        return ResponseEntity.ok(response);
    }

}
