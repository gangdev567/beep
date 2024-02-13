package com.itwill.beep.web;

import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.UserAccountEntity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itwill.beep.domain.FollowEntity;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.FollowService;
import com.itwill.beep.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/follow")
public class FollowController {
    private final FollowService followService;
    private final UserService userService;

    @GetMapping("/list")
    public String getFollowingList(Model model) {
        log.info("getFollowingList()");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAccountEntity userAccount = userService.findUserByUserName(authentication.getName());

        // 사용자가 팔로우하는 사람들의 목록 조회
        model.addAttribute("followingList", followService.getFollowings(userAccount));

        return "followingList"; // 팔로잉 목록을 보여주는 뷰의 이름
    }

}
