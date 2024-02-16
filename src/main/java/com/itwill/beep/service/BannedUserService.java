package com.itwill.beep.service;

import org.springframework.stereotype.Service;

import com.itwill.beep.domain.BannedUserEntity;
import com.itwill.beep.domain.BannedUserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BannedUserService {

    private final BannedUserRepository banDao;
    
    public void ban(BannedUserEntity bannedUser) {
        
        banDao.save(bannedUser);
    }
}
