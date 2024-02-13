package com.itwill.beep.web;

import com.itwill.beep.domain.UserAccountEntity;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.itwill.beep.domain.FollowEntity;
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
    public ResponseEntity<Boolean> follow(@PathVariable("following") Long toUserNo) {
        log.info("follow(toUserNo: {})", toUserNo);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        UserAccountEntity follower = userService.findUserByUserName(authentication.getName());
        UserAccountEntity following = userService.findByUserId(toUserNo);

        followService.follow(follower, following);
        log.info("{} 님이 {} 님을 팔로우합니다.", follower.getUserName(), following.getUserName());

        return ResponseEntity.ok(true);
    }

    @DeleteMapping("/delete/{following}")
    public ResponseEntity<Boolean> unfollow(@PathVariable("toUserNo") Long toUserNo) {
        log.info("unfollow(toUserNo: {})", toUserNo);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        UserAccountEntity loggedInUser = userService.findUserByUserName(authentication.getName());
        UserAccountEntity unfollowUser = userService.findByUserId(toUserNo);

        followService.unfollow(loggedInUser, unfollowUser);
        log.info("{} 님이 언팔로우합니다.", loggedInUser.getUserName());

        return ResponseEntity.ok(true);
    }

    @GetMapping("/status/{following}")
    public ResponseEntity<Map<String, Boolean>> getFollowStatus(
            @PathVariable("toUserNo") Long toUserNo) {
        log.info("getFollowStatus(toUserNo: {})", toUserNo);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAccountEntity fromUser = userService.findUserByUserName(authentication.getName());
        UserAccountEntity toUser = userService.findByUserId(toUserNo);

        boolean isFollowing = followService.isFollowing(fromUser, toUser);

        Map<String, Boolean> response = new HashMap<>();
        response.put("isFollowing", isFollowing);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/followlist/{fromUserNo}")
    public ResponseEntity<Map<String, Object>> getFollowList(
            @PathVariable("fromUserNo") Long fromUserNo) {
        log.info("getFollowList(fromUserNo: {})", fromUserNo);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        UserAccountEntity fromUser = userService.findUserByUserName(authentication.getName());

        Long countByFromUser = followService.countFollowings(fromUser);
        List<FollowEntity> followList = followService.getFollowings(fromUser);

        Map<String, Object> response = new HashMap<>();
        response.put("countByFollow", countByFromUser);
        response.put("followList", followList);

        log.info("response: {}", response);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/followerlist/{toUserNo}")
    public ResponseEntity<Map<String, Object>> getFollowerCount(
            @PathVariable("toUserNo") Long toUserNo) {
        log.info("getFolloweCount(toUserNo: {})", toUserNo);

        UserAccountEntity toUser = userService.findByUserId(toUserNo);
        Long countFollowerByToUser = followService.countFollowers(toUser);
        List<FollowEntity> followerList = followService.getFollowers(toUser);

        Map<String, Object> response = new HashMap<>();
        response.put("countByFollower", countFollowerByToUser);
        response.put("followerList", followerList);

        return ResponseEntity.ok(response);
    }

}
