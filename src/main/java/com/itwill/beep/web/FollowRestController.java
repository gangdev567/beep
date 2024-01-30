package com.itwill.beep.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.itwill.beep.web.service.FollowService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/follow/")
public class FollowRestController {
    private final FollowService followService;

    // @PostMapping("{toUserId}")
    // public ResponseEntity<Boolean> follow(Authentication authentication,@PathVariable("toUserId")
    // Long toUserId) {
    // User from_user = userService.findUser(authentication.getName());
    // User to_user = userService.findUser(friendName);
    // followService.follow(from_user, to_user);
    // return ResponseEntity.ok(true);
    // }

    // public ResponseEntity<Boolean> unfollow(Authentication authentication) {
    // followService.unfollow(followService.unfollow(authentication));
    //
    // return ResponseEntity.ok(true);
    // }

}
