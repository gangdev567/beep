package com.itwill.beep.dto;

import com.itwill.beep.domain.Channel;

import lombok.Data;

@Data
public class BroadcastOnDto {

    private Long channelId;
    private String title;
    private String content;
    
    public Channel toEntity() {
        return Channel.builder()
                .channelId(channelId)
                .title(title)
                .content(content)
                .build();
    }
}
