package com.itwill.beep.web.service;

import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class FollowService {
    // private final FollowRepository followRepository;
    //
    // /**
    // * 주어진 사용자가 다른 사용자를 팔로우합니다.
    // *
    // * @param from_user 팔로우를 시작하는 사용자
    // * @param to_user 팔로우를 받는 사용자
    // */
    // public void follow(User from_user, User to_user) {
    // validateSameUser(from_user, to_user);
    // validateAlreadyFollowed(from_user, to_user);
    //
    // Follow follow = Follow.builder().fromUser(from_user).toUser(to_user).build();
    // followRepository.save(follow);
    // }
    //
    // /**
    // * 주어진 사용자가 팔로우한 관계를 해제합니다.
    // *
    // * @param user 팔로우를 해제하는 사용자
    // */
    // public void unfollow(User user) {
    // followRepository.deleteFollowByFromUser(user);
    // }
    //
    // /**
    // * 주어진 사용자를 팔로우하는 사용자 수를 반환합니다.
    // *
    // * @param toUser 팔로우를 받는 사용자
    // * @return 팔로워 수
    // */
    // public Long countByToUser(User toUser) {
    // return followRepository.countByToUser(toUser);
    // }
    //
    // /**
    // * 주어진 사용자가 팔로우하는 사용자 수를 반환합니다.
    // *
    // * @param fromUser 팔로우를 시작하는 사용자
    // * @return 팔로잉 수
    // */
    // public Long countByFromUser(User fromUser) {
    // return followRepository.countByFromUser(fromUser);
    // }
    //
    // /**
    // * 주어진 사용자가 팔로우하는 사용자 목록을 반환합니다.
    // *
    // * @param fromUser 팔로우를 시작하는 사용자
    // * @return 팔로잉 목록
    // */
    // public List<Follow> findByFromUser(User fromUser) {
    // return followRepository.findByFromUser(fromUser);
    // }
    //
    // /**
    // * 주어진 사용자를 팔로우하는 사용자 목록을 반환합니다.
    // *
    // * @param toUser 팔로우를 받는 사용자
    // * @return 팔로워 목록
    // */
    // public List<Follow> findByToUser(User toUser) {
    // return followRepository.findByToUser(toUser);
    // }
    //
    // /**
    // * 주어진 두 사용자 간의 팔로우 관계를 조회합니다.
    // *
    // * @param fromUser 팔로우를 시작하는 사용자
    // * @param toUser 팔로우를 받는 사용자
    // * @return 팔로우 관계
    // */
    // public Optional<Follow> findFollow(User fromUser, User toUser) {
    // return followRepository.findFollow(fromUser, toUser);
    // }
    //
    //
    // /**
    // * 두 사용자가 동일한지 확인하고, 동일한 경우 IllegalArgumentException을 던집니다.
    // *
    // * @param from_user 팔로우를 시작하는 사용자
    // * @param to_user 팔로우를 받는 사용자
    // */
    // private void validateSameUser(User from_user, User to_user) {
    // if (from_user.equals(to_user)) {
    // throw new IllegalArgumentException("팔로우 대상이 자기 자신과 동일합니다.");
    // }
    // }
    //
    // /**
    // * 이미 팔로우한 경우를 확인하고, 팔로우한 경우의 처리를 수행합니다.
    // *
    // * @param from_user 팔로우를 시작하는 사용자
    // * @param to_user 팔로우를 받는 사용자
    // */
    // private void validateAlreadyFollowed(User from_user, User to_user) {
    // if (followRepository.findFollow(from_user, to_user).isPresent()) {
    // throw new IllegalStateException("이미 팔로우한 사용자입니다.");
    // }
    // }

}
