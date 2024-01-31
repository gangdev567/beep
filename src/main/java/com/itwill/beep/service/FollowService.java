package com.itwill.beep.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import com.itwill.beep.domain.Account;
import com.itwill.beep.domain.Follow;
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
     * @param fromUserNo 팔로우를 시작하는 사용자
     * @param toUserNo 팔로우를 받는 사용자
     */
    public void follow(Account fromUserNo, Account toUserNo) {
        validateSameUser(fromUserNo, toUserNo);
        validateAlreadyFollowed(fromUserNo, toUserNo);

        Follow follow = Follow.builder().fromUserNo(fromUserNo).toUserNo(toUserNo)
                .createTime(LocalDateTime.now()).build();
        followRepository.save(follow);
    }

    /**
     * 한 사용자가 팔로우한 관계를 해제합니다.
     *
     * @param user 팔로우를 해제하는 사용자
     */
    @Transactional
    public void unfollow(Account fromUserNo, Account toUserNo) {
        followRepository.deleteByFromUserNoAndToUserNo(fromUserNo, toUserNo);
    }

    /**
     * 주어진 사용자가 팔로우하는 사용자 수를 반환합니다.
     *
     * @param fromUser 팔로우를 시작하는 사용자
     * @return 팔로잉 수
     */
    public Long countByFromUser(Account fromUserNo) {
        return followRepository.countByFromUserNo(fromUserNo);
    }

    /**
     * 주어진 사용자를 팔로우하는 사용자 수를 반환합니다.
     *
     * @param toUser 팔로우를 받는 사용자
     * @return 팔로워 수
     */
    public Long countFollowersByToUser(Account toUserNo) {
        return followRepository.countByToUserNo(toUserNo);
    }

    /**
     * 주어진 사용자가 팔로우하는 사용자 목록을 반환합니다.
     *
     * @param fromUser 팔로우를 시작하는 사용자
     * @return 팔로잉 목록
     */
    public List<Follow> findByFromUser(Account fromUserNo) {
        return followRepository.findByFromUserNo(fromUserNo);
    }

    /**
     * 주어진 두 사용자 간의 팔로우 관계를 조회합니다.
     *
     * @param fromUser 팔로우를 시작하는 사용자
     * @param toUser 팔로우를 받는 사용자
     * @return 팔로우 관계(Optional)
     */
    public Optional<Follow> findFollow(Account fromUserNo, Account toUserNo) {
        return followRepository.findByFromUserNoAndToUserNo(fromUserNo, toUserNo);
    }

    /**
     * 두 사용자가 동일한지 확인하고, 동일한 경우 IllegalArgumentException을 던집니다.
     *
     * @param fromUser 팔로우를 시작하는 사용자
     * @param toUser 팔로우를 받는 사용자
     */
    private void validateSameUser(Account fromUserNo, Account toUserNo) {
        if (fromUserNo.equals(toUserNo)) {
            throw new IllegalArgumentException("팔로우 대상이 자기 자신과 동일합니다.");
        }
    }

    /**
     * 이미 팔로우한 경우를 확인하고, 팔로우한 경우의 처리를 수행합니다.
     *
     * @param fromUser 팔로우를 시작하는 사용자
     * @param toUser 팔로우를 받는 사용자
     */
    private void validateAlreadyFollowed(Account fromUserNo, Account toUserNo) {
        if (followRepository.findByFromUserNoAndToUserNo(fromUserNo, toUserNo).isPresent()) {
            throw new IllegalStateException("이미 팔로우한 사용자입니다.");
        }
    }
}
