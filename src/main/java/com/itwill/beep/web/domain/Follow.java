package com.itwill.beep.web.domain;

import java.time.LocalDateTime;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "follow")
public class Follow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long followId;

    // @ToString.Exclude
    // @ManyToOne(fetch = FetchType.LAZY)
    // @JoinColumn(name = "from_user")
    // private User fromUser;
    //
    // @ToString.Exclude
    // @ManyToOne(fetch = FetchType.LAZY)
    // @JoinColumn(name = "toUser")
    // private User toUser;

    // 유저 테이블에 추가해야 할 필드
    // @OneToMany(mappedBy = "follower")
    // private List<Follow> followerList;
    //
    // @OneToMany(mappedBy = "following")
    // private List<Follow> followingList;

    private LocalDateTime createTime;
}
