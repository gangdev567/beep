package com.itwill.beep.service;

import com.itwill.beep.domain.UserAccountEntity;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.stereotype.Service;
import com.itwill.beep.domain.FollowEntity;
import com.itwill.beep.domain.FollowRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class FollowService {
    private final FollowRepository followRepository;

    /**
     * 한 사용자가 다른 사용자를 팔로우합니다.
     *
     * @param followerUserAccount 팔로우를 신청하는 사용자
     * @param followingUserAccount 팔로우를 받는 사용자
     */
    public void follow(UserAccountEntity followerUserAccount, UserAccountEntity followingUserAccount) {
        validateSameUser(followerUserAccount, followingUserAccount);
        validateAlreadyFollowed(followerUserAccount, followingUserAccount);

        FollowEntity follow = FollowEntity.builder().followerUserAccount(followerUserAccount).followingUserAccount(followingUserAccount)
                .createdTime(LocalDateTime.now()).build();
        followRepository.save(follow);
    }

    /**
     * 한 사용자가 팔로우한 관계를 해제합니다.
     *
     * @param followerUserAccount 팔로우를 해제하는 사용자
     */
    @Transactional
    public void unfollow(UserAccountEntity followerUserAccount, UserAccountEntity followingUserAccount) {
        followRepository.deleteByFollowerUserAccountAndFollowingUserAccount(followerUserAccount, followingUserAccount);
    }

    /**
     * 주어진 사용자가 팔로우하는 사용자 수를 반환합니다.
     *
     * @param followingUserAccount 팔로우를 신청하는 사용자
     * @return 팔로잉 수
     */
    public Long countFollowingUsers(UserAccountEntity followerUserAccount) {
        return followRepository.countByFollowingUserAccount(followingUserAccount);
    }

    /**
     * 주어진 사용자를 팔로우하는 사용자 수를 반환합니다.
     *
     * @param toUser 팔로우를 받는 사용자
     * @return 팔로워 수
     */
    public Long countFollowersByToUser(UserAccountEntity toUserNo) {
        return followRepository.countByToUserNo(toUserNo);
    }

    /**
     * 주어진 사용자가 팔로우하는 사용자 목록을 반환합니다.
     *
     * @param fromUser 팔로우를 시작하는 사용자
     * @return 팔로잉 목록
     */
    public List<FollowEntity> findByFromUser(Account fromUserNo) {
        return followRepository.findByFromUserNo(fromUserNo);
    }

    /**
     * 주어진 사용자를 팔로우하는 사용자 목록을 반환합니다.
     *
     * @param toUserNo 팔로우를 받는 사용자
     * @return 팔로워 목록
     */
    public List<FollowEntity> findByToUser(Account toUserNo) {
        return followRepository.findByToUserNo(toUserNo);
    }


    /**
     * 주어진 사용자가 다른 사용자를 팔로우 중인지 여부를 반환합니다.
     *
     * @param followerUserAccount 팔로우를 시작하는 사용자
     * @param followingUserAccount 팔로우를 받는 사용자
     * @return 팔로우 중인지 여부
     */
    public boolean isFollowing(UserAccountEntity followerUserAccount, UserAccountEntity followingUserAccount) {
        return followRepository.existsByFollowerUserAccountAndFollowingUserAccount(followerUserAccount, followingUserAccount);
    }

    /**
     * 두 사용자가 동일한지 확인하고, 동일한 경우 IllegalArgumentException을 던집니다.
     *
     * @param fromUser 팔로우를 시작하는 사용자
     * @param toUser 팔로우를 받는 사용자
     */
    private void validateSameUser(UserAccountEntity fromUserNo, UserAccountEntity toUserNo) {
        if (fromUserNo.getId().equals(toUserNo.getId())) {
            throw new IllegalArgumentException("팔로우 대상이 자기 자신과 동일합니다.");
        }
    }

    /**
     * 이미 팔로우한 경우를 확인하고, 팔로우한 경우의 처리를 수행합니다.
     *
     * @param fromUser 팔로우를 시작하는 사용자
     * @param toUser 팔로우를 받는 사용자
     */
    private void validateAlreadyFollowed(UserAccountEntity fromUserNo, UserAccountEntity toUserNo) {
        if (followRepository.findByFromUserNoAndToUserNo(fromUserNo, toUserNo).isPresent()) {
            throw new IllegalStateException("이미 팔로우한 사용자입니다.");
        }
    }
}
