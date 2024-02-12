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

    @GetMapping("/followers")
    public String getFollowerList(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); // 현재 인증된 사용자의 이름(또는 아이디) 가져오기

        // 사용자 이름(또는 아이디)를 기반으로 UserAccountEntity 찾기
        UserAccountEntity userAccount = userService.findUserByUserName(username);

        // 사용자의 팔로워 목록 조회
        model.addAttribute("followers", followService.getFollowers(userAccount));

        return "followers"; // 팔로워 목록을 보여주는 뷰의 이름
    }

    @GetMapping("/followings")
    public String getFollowingList(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); // 현재 인증된 사용자의 이름(또는 아이디) 가져오기

        // 사용자 이름(또는 아이디)를 기반으로 UserAccountEntity 찾기
        UserAccountEntity userAccount = userService.findUserByUserName(username);

        // 사용자가 팔로우하는 사람들의 목록 조회
        model.addAttribute("followings", followService.getFollowings(userAccount));

        return "followings"; // 팔로잉 목록을 보여주는 뷰의 이름
    }

}
