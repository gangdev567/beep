package com.itwill.beep.domain;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ChannelRepository extends JpaRepository<Channel, Long> {

    @EntityGraph(attributePaths = "status")
    Channel findByAccount(Account account);

    // 테이블을 조인하게 해주는 애너테이션 그런데 왜
    // 예전에 만든 emp dept 같은 것들은 이거 없이도 잘만 작동했었는데
    // 이게 없으면 조인을 못할까... 이것도 해본적은 있지만 헷갈려서 한참 찾았네
    @EntityGraph(attributePaths = "account")
    Channel findByChannelId(Long channelId);

    @Modifying // 업데이트 쿼리를 받게끔 만듬
    @Query("UPDATE Channel c SET c.viewers = c.viewers + 1 WHERE c.channelId = :channelId")
    void increaseViewer(@Param("channelId") Long channelId);

    @Modifying
    @Query("UPDATE Channel c SET c.viewers = c.viewers - 1 WHERE c.channelId = :channelId")
    void decreaseViewer(@Param("channelId") Long channelId);

    @Query("SELECT c.viewers from Channel c WHERE c.channelId = :channelId")
    Long findViewersByChannelId(@Param("channelId") Long channelId);

    @Modifying
    @Query("UPDATE Channel c SET c.viewers = 0 WHERE c.channelId = :channelId")
    void viewersSetZero(@Param("channelId") Long channelId);
    
    @Modifying
    @Query("UPDATE Channel c SET c.title = :title, c.content = :content WHERE c.channelId = :channelId")
    void update(@Param("channelId") Long channelId,@Param("title") String title,@Param("content") String content);
    
}
