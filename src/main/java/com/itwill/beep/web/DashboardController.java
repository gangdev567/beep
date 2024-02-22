package com.itwill.beep.web;

import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.dto.FollowerListRequestDto;
import com.itwill.beep.dto.FollowerSearchRequestDto;
import com.itwill.beep.dto.UserSecurityDto;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.FollowService;
import com.itwill.beep.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/dashboard/u/{username}")
public class DashboardController {
    private final UserService userService;
    private final ChannelService channelService;
    private final FollowService followService;


    // 공통 모델 설정 메소드
    private String commonModelSetup(String userName, Authentication authentication, Model model,
            String viewName) {
        
        UserAccountEntity user = userService.findUserByUserName(userName);
        
        model.addAttribute("user", user);

        // viewName을 기반으로 경로 접두사를 결정합니다.
        String pathPrefix = determinePathPrefix(viewName);

        log.info("dashboard/user/{}{}", pathPrefix, viewName);
        // 동적으로 결정된 뷰 경로를 반환합니다.
        return String.format("dashboard/user/%s%s", pathPrefix, viewName);
    }

    private String determinePathPrefix(String viewName) {
        // 기본 접두사를 초기화합니다.
        String pathPrefix = "";

        if (viewName.equals("analytics") || viewName.equals("community")
                || viewName.equals("content") || viewName.equals("settings")
                || viewName.equals("viewer-rewards")) {
            // 기본 뷰 이름에 대해서는 접두사 없이 처리합니다.
            pathPrefix = "";
        } else if (viewName.startsWith("analytics")) {
            pathPrefix = "analytics/";
        } else if (viewName.startsWith("community")) {
            pathPrefix = "community/";
        } else if (viewName.startsWith("content")) {
            // 'contentClipsChannel' 같은 특정 패턴을 처리합니다.
            if (viewName.startsWith("contentClips")) {
                // 'content/clips/' 접두사를 추가하여 경로를 구성합니다.
                pathPrefix = "content/clips/";
            } else {
                pathPrefix = "content/";
            }

        } else if (viewName.startsWith("settings")) {
            if (viewName.startsWith("settingsChannel")) {
                // 'content/clips/' 접두사를 추가하여 경로를 구성합니다.
                pathPrefix = "settings/channel/";
            } else {
                pathPrefix = "settings/";
            }

        } else if (viewName.startsWith("viewerRewards")) {
            pathPrefix = "viewerRewards/";
        }

        return pathPrefix;
    }

    @GetMapping("/follower")
    public String followerPage(@RequestParam(name = "p", defaultValue = "0") int p, Model model) {
        log.info("followerPage(p={})", p);

        Page<FollowerListRequestDto> followersList = null;
        Long followersCount = 0L;
        UserAccountEntity loginUser = null;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (authentication.getPrincipal() instanceof OAuth2User) {
            loginUser = userService.findUserByUserName(
                    (String) ((OAuth2User) principal).getAttributes().get("name"));
            followersCount = followService.countFollowers(loginUser);
            followersList = followService.followingList(
                    (String) ((OAuth2User) principal).getAttributes().get("name"), p);
        } else if (authentication.isAuthenticated()) {
            loginUser = userService.findUserByUserName(authentication.getName());
            followersCount = followService.countFollowers(loginUser);
            followersList = followService.followingList(authentication.getName(), p);
        } else {
            log.info("로그인되지 않은 사용자입니다.");
        }
        model.addAttribute("followersCount", followersCount);
        model.addAttribute("followersList", followersList);

        // fragments 에 필요한 모델
        model.addAttribute("userAccount", loginUser);

        // myModal에 필요한 모델
        ChannelEntity forModal = channelService.findChannelByUserAccount(loginUser);
        model.addAttribute("channel", forModal);
        if (forModal != null) {
            String status = forModal.getStreamingStateSet().toString();
            model.addAttribute("status", status);
        }

        return "follower";
    }

    @GetMapping("/search")
    public String followerSearch(@ModelAttribute FollowerSearchRequestDto dto, Model model) {
        log.info("followerSearch(dto={})", dto);

        Page<FollowerListRequestDto> searchResult = null;
        Long followersCount = 0L;
        UserAccountEntity loginUser = null;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (authentication.getPrincipal() instanceof OAuth2User) {
            loginUser = userService.findUserByUserName(
                    (String) ((OAuth2User) principal).getAttributes().get("name"));
            followersCount = followService.countFollowers(loginUser);
            dto.setFollowingUserAccountUserNickname(
                    (String) ((OAuth2User) principal).getAttributes().get("name"));
            searchResult = followService.search(dto);
            log.info("searchResult={}", searchResult);
        } else if (authentication.isAuthenticated()) {
            loginUser = userService.findUserByUserName(authentication.getName());
            followersCount = followService.countFollowers(loginUser);
            dto.setFollowingUserAccountUserNickname(authentication.getName());
            searchResult = followService.search(dto);
            log.info("searchResult={}", searchResult);
        } else {
            log.info("로그인되지 않은 사용자입니다.");
        }

        model.addAttribute("followersCount", followersCount);
        model.addAttribute("followersList", searchResult);

        // fragments 에 필요한 모델
        model.addAttribute("userAccount", loginUser);

        // myModal에 필요한 모델
        ChannelEntity forModal = channelService.findChannelByUserAccount(loginUser);
        model.addAttribute("channel", forModal);
        if (forModal != null) {
            String status = forModal.getStreamingStateSet().toString();
            model.addAttribute("status", status);
        }

        return "follower";
    }

    // 대시보드 홈
    @GetMapping("/home")
    public String userDashboardHome(@PathVariable("username") String userName, Authentication authentication,
            Model model) {
        log.info("Accessing dashboard home for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "dashboardHome");
    }

    // 방송 관리자
    @GetMapping("/stream-manager")
    public String streamManager(@PathVariable("username") String userName, Authentication authentication,
            Model model) {
        log.info("Accessing stream manager for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "streamManager");
    }

    // 알림
    @GetMapping("/stream-alerts")
    public String streamAlerts(@PathVariable("username") String userName, Authentication authentication,
            Model model) {
        log.info("Accessing stream alerts for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "streamAlerts");
    }

    // 분석 - 한눈에 보기
    @GetMapping("/analytics")
    public String analyticsOverview(@PathVariable("username") String userName, Authentication authentication,
            Model model) {
        log.info("Accessing analytics overview for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "analyticsOverview");
    }

    // 분석 - 연구
    @GetMapping("/analytics/research")
    public String analyticsResearch(@PathVariable("username") String userName, Authentication authentication,
            Model model) {
        log.info("Accessing analytics research for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "analyticsResearch");
    }

    // 분석 - 업적
    @GetMapping("/analytics/achievements")
    public String analyticsAchievements(@PathVariable("username") String userName,
            Authentication authentication, Model model) {
        log.info("Accessing analytics achievements for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "analyticsAchievements");
    }

    // 분석 - 방송 요약
    @GetMapping("/analytics/stream-summary")
    public String analyticsStreamSummary(@PathVariable("username") String userName,
            Authentication authentication, Model model) {
        log.info("Accessing stream summary for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "analyticsStreamSummary");
    }

    // 분석 - 시청자 발견
    @GetMapping("/analytics/viewer-discovery")
    public String analyticsViewerDiscovery(@PathVariable("username") String userName,
            Authentication authentication, Model model) {
        log.info("Accessing viewer discovery for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "analyticsViewerDiscovery");
    }

    // 분석 - 시청자 참여
    @GetMapping("/analytics/viewer-engagement")
    public String analyticsViewerEngagement(@PathVariable("username") String userName,
            Authentication authentication, Model model) {
        log.info("Accessing viewer engagement for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "analyticsViewerEngagement");
    }

    // 커뮤니티 - 역할 관리자
    @GetMapping("/community/roles")
    public String communityRoles(@PathVariable("username") String userName, Authentication authentication,
            Model model) {
        log.info("Accessing community roles for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "communityRoles");
    }

    // 커뮤니티 - 활동
    @GetMapping("/community/activity")
    public String communityActivity(@PathVariable("username") String userName, Authentication authentication,
            Model model) {
        log.info("Accessing community activity for user: {}", userName);
        return commonModelSetup(userName, authentication, model, "communityActivity");
    }

    // 커뮤니티 - 팔로워 목록
    @GetMapping("/community/followers-list")
    public String communityFollowersList(@PathVariable("username") String username,
            Authentication authentication, Model model) {
        log.info("Accessing followers list for user: {}", username);
        return commonModelSetup(username, authentication, model, "communityFollowersList");
    }

    // 콘텐츠 - 비디오 프로듀서
    @GetMapping("/content/video-producer")
    public String contentVideoProducer(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing video producer for user: {}", username);
        return commonModelSetup(username, authentication, model, "contentVideoProducer");
    }

    // 콘텐츠 - 컬렉션
    @GetMapping("/content/collections")
    public String contentCollections(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing collections for user: {}", username);
        return commonModelSetup(username, authentication, model, "contentCollections");
    }

    // 콘텐츠 - 클립
    @GetMapping("/content/clips/channel")
    public String contentClips(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing clips for user: {}", username);
        return commonModelSetup(username, authentication, model, "contentClipsChannel");
    }

    // 콘텐츠 - 저작권 침해 신고 관리자
    @GetMapping("/content/claims")
    public String contentClaims(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing content claims for user: {}", username);
        return commonModelSetup(username, authentication, model, "contentClaims");
    }

    // 설정 - 방송
    @GetMapping("/settings/stream")
    public String settingsStream(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing stream settings for user: {}", username);
        return commonModelSetup(username, authentication, model, "settingsStream");
    }

    // 설정 - 채널 정보
    @GetMapping("/settings/channel")
    public String settingsChannelInfo(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing channel info settings for user: {}", username);
        return commonModelSetup(username, authentication, model, "settingsChannelInfo");
    }

    // 설정 - 채널 브랜드
    @GetMapping("/settings/channel/brand")
    public String settingsChannelBrand(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing channel brand settings for user: {}", username);
        return commonModelSetup(username, authentication, model, "settingsChannelBrand");
    }

    // 설정 - 채널 추천 콘텐츠
    @GetMapping("/settings/channel/featured-content")
    public String settingsChannelFeaturedContent(@PathVariable("username") String username,
            Authentication authentication, Model model) {
        log.info("Accessing channel featured content settings for user: {}", username);
        return commonModelSetup(username, authentication, model, "settingsChannelFeaturedContent");
    }

    // 설정 - 채널 일정
    @GetMapping("/settings/channel/schedule")
    public String settingsChannelSchedule(@PathVariable("username") String username,
            Authentication authentication, Model model) {
        log.info("Accessing channel schedule settings for user: {}", username);
        return commonModelSetup(username, authentication, model, "settingsChannelSchedule");
    }

    // 설정 - 검토
    @GetMapping("/settings/moderation")
    public String settingsModeration(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing moderation settings for user: {}", username);
        return commonModelSetup(username, authentication, model, "settingsModeration");
    }

    // 시청자 보상 - 드롭스
    @GetMapping("/viewer-rewards/drops")
    public String viewerRewardsDrops(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing viewer rewards drops for user: {}", username);
        return commonModelSetup(username, authentication, model, "viewerRewardsDrops");
    }

    // 시청자 보상 - 보상
    @GetMapping("/viewer-rewards/reward-campaigns")
    public String viewerRewardsRewardCampaigns(@PathVariable("username") String username,
            Authentication authentication, Model model) {
        log.info("Accessing viewer rewards campaigns for user: {}", username);
        return commonModelSetup(username, authentication, model, "viewerRewardsRewardCampaigns");
    }

    // 함께 방송
    @GetMapping("/guest-star")
    public String guestStar(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing guest star for user: {}", username);
        return commonModelSetup(username, authentication, model, "guestStar");
    }

    // 방송 도구
    @GetMapping("/broadcast")
    public String broadcastTools(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing broadcast tools for user: {}", username);
        return commonModelSetup(username, authentication, model, "broadcastTools");
    }

    // 확장 프로그램
    @GetMapping("/extensions")
    public String extensions(@PathVariable("username") String username, Authentication authentication,
            Model model) {
        log.info("Accessing extensions for user: {}", username);
        return commonModelSetup(username, authentication, model, "extensions");
    }
}
