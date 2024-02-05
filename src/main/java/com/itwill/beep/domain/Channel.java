package com.itwill.beep.domain;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE) @Builder
@Getter
@ToString
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
@Entity @Table(name = "channels")
public class Channel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 열시퀸스
    @Column(name = "channel_id")
    private Long channelId;
    
    @ToString.Exclude
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_no")
    private Account account;
    
    private String title;
    
    private String content;
    
    @CreatedDate
    private LocalDateTime created_time;
    
    private String profile_img;
    
    private Long category_id;
    
    private Long viewers;

    // 빌더패턴을 이용해서 객체를 생성할 때 nullPointExeption이 발생하는 것을 
    // 방지하기 위해 비어있는 Set<>을 생성하는 에너테이션
    @Builder.Default 
//    @ToString.Exclude 
    @ElementCollection(fetch = FetchType.LAZY)
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "broadcast", joinColumns = @JoinColumn(name = "channel_id")) 
    // 애너테이션 안에서 애너테이션을 한 번 더 사용할 수 있다는 놀라운 사실!
    // 쉽게 설명해서 @CollectionTable 가 조인할 테이블의 이름을 설정하고
    // 애너테이션 안에 @JoinColumn을 사용하여 설정한 테이블의 설정한 컬럼과 조인하도록 만든 것이다.
    private Set<Broadcast> status = new HashSet<>();
    
    public Channel setStatus(Broadcast stat) {
        status.clear();
        status.add(stat);
        return this;
    }
    
}
