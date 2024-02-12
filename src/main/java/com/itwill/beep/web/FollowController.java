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
    private final ChannelService channelService;

    @GetMapping("/list")
    public String getFollowingList(Model model) {
        log.info("getFollowingList()");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAccountEntity followwingByfromUser = userService.loginUser(authentication.getName());

        List<FollowEntity> list = followService.findByFromUser(followwingByfromUser);
        List<ChannelEntity> channelList = new ArrayList<>();

        list.forEach((follow) -> {
            ChannelEntity channel = channelService.findChannelByAccount(follow.getFollowingUser());
            if (channel != null) {
                channelList.add(channel);
            }
        });

        Map<String, Object> data = new HashMap<>();
        data.put("followList", list);
        data.put("channelList", channelList);

        log.info(data.toString());

        model.addAttribute("data", data);

        return "followlist";
    }

}
