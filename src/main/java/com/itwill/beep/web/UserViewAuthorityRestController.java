package com.itwill.beep.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.beep.domain.BannedUserEntity;
import com.itwill.beep.domain.BannedUserRepository;
import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.dto.UserViewAuthorityDto;
import com.itwill.beep.service.BannedUserService;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/user")
@RestController
public class UserViewAuthorityRestController {
    
    private final UserService userService;
    private final ChannelService channelService;
    private final BannedUserService bannedUserService;

    @PostMapping("/ban")
    public ResponseEntity<Boolean> userBan(@RequestBody UserViewAuthorityDto dto) {
        log.info("UserViewAuthorityDto = {}", dto);
        
        UserAccountEntity user = userService.findUserByUserNickname(dto.getUserNickname());
        ChannelEntity channel = channelService.findChannelById(dto.getChannelId());
        
        BannedUserEntity bannedUser = BannedUserEntity.builder()
                                                .userId(user)
                                                .channelId(channel)
                                                .build();
        
        bannedUserService.ban(bannedUser);
        
        return ResponseEntity.ok(true);
    }
}
