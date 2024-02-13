package com.itwill.beep.domain;

import java.util.List;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ChannelRepository extends JpaRepository<ChannelEntity, Long> {

<<<<<<< HEAD
    @EntityGraph(attributePaths = "streamingStateSet")
    ChannelEntity findBychannelUserAccountEntity(UserAccountEntity userAccountEntity);
=======
    @EntityGraph(attributePaths = "status")
    ChannelEntity findByChannelUserAccountEntity(UserAccountEntity userAccountEntity);

>>>>>>> a78c677c2385d9bec0fa731a06da4d3ec9324a84

    // 테이블을 조인하게 해주는 애너테이션 그런데 왜
    // 예전에 만든 emp dept 같은 것들은 이거 없이도 잘만 작동했었는데
    // 이게 없으면 조인을 못할까... 이것도 해본적은 있지만 헷갈려서 한참 찾았네
    // @EntityGraph(attributePaths = "UserAcoountEntity")
    ChannelEntity findByChannelId(Long channelId);

    @Modifying // 업데이트 쿼리를 받게끔 만듬
    @Query("UPDATE ChannelEntity c SET c.channelViewerCount = c.channelViewerCount + 1 WHERE c.channelId = :channelId")
    void increaseViewer(@Param("channelId") Long channelId);

    @Modifying
    @Query("UPDATE ChannelEntity c SET c.channelViewerCount = c.channelViewerCount - 1 WHERE c.channelId = :channelId")
    void decreaseViewer(@Param("channelId") Long channelId);

    @Query("SELECT c.channelViewerCount from ChannelEntity c WHERE c.channelId = :channelId")
    Long findViewersByChannelId(@Param("channelId") Long channelId);

    @Modifying
    @Query("UPDATE ChannelEntity c SET c.channelViewerCount = 0 WHERE c.channelId = :channelId")
    void viewersSetZero(@Param("channelId") Long channelId);
    
    @Modifying
    @Query("UPDATE ChannelEntity c SET c.channelTitle = :title, c.channelContent = :content, c.categoryEntityOfChannel.categoryId = :categoryId WHERE c.channelId = :channelId")
    void update(@Param("channelId") Long channelId,@Param("title") String title,@Param("content") String content, @Param("categoryId")Long categoryId);
    
    /* 카테고리 아이디로 채널 검색하기 */

    List<ChannelEntity> findByCategoryEntityOfChannelCategoryId(Long categoryId);

    
}
