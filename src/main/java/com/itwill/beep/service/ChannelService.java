package com.itwill.beep.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Channel;
import com.itwill.beep.domain.ChannelRepository;
import com.itwill.beep.dto.BroadcastOnDto;

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
    }

    @Transactional
    public void increaseViewers(Long channelId) {
        
        // 청자수 증가
        channelDao.increaseViewer(channelId);
        
    }

    @Transactional
    public void decreaseViewers(Long channelId) {
        
        // 청자수 감소
        channelDao.decreaseViewer(channelId);
        
        // 시청자 수 셀렉트
        Long viewers = channelDao.findViewersByChannelId(channelId);
        
        // 시청자가 버그로 인해 0명 보다 적어질 경우 0명으로 리셋
        if (viewers < 0) {
            channelDao.viewersSetZero(channelId);
        }
        
    }

    @Transactional
    public void update(BroadcastOnDto dto) {
        // 뭐가 오류가 생겼는데 하드코딩하면 해결 될 것 같아서 하드 코딩함
        Long channelId = dto.getChannelId();
        String title = dto.getTitle();
        String content = dto.getContent();
        /* 카테고리아이디 추가 */
        Long categoryId = dto.getCategoryId();
        
        channelDao.update(channelId, title, content, categoryId);
        
    }
    
    /* 카테고리 아이디로 채널 검색하기 */
    public List<Channel> findByCategoryCategoryId(Long categoryId) {
        log.info("findByCategoryCategoryId(categoryId={})", categoryId);
        List<Channel> list = channelDao.findByCategoryCategoryId(categoryId);
        
        return list;
    }
}
