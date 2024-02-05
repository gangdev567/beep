package com.itwill.beep.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Channel;
import com.itwill.beep.domain.ChannelRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChannelService {
    
    private final ChannelRepository channelDao;
    
    public Channel findChannelByAccount(Account acconut) {
        Channel channel = channelDao.findByAccount(acconut);
        return channel;
    }

    public Channel findChannelById(Long channelId) {
        Channel channel = channelDao.findByChannelId(channelId);
        return channel;
    }

    public void save(Channel channel) {
        channelDao.save(channel);
    }

    public List<Channel> findAllChannel() {
        
        List<Channel> channelList = channelDao.findAll();
        
        return channelList;
    };
}
