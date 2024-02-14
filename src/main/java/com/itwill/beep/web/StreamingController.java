package com.itwill.beep.web;

import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.StreamingState;
import com.itwill.beep.domain.UserAccountEntity;
import com.itwill.beep.service.StreamingService;
import java.util.Map;
import java.util.Set;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itwill.beep.dto.StreamingOnDto;
import com.itwill.beep.dto.ChatRoom;
import com.itwill.beep.service.ChannelService;
import com.itwill.beep.service.ChatService;
import com.itwill.beep.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/streaming")
public class StreamingController {

    private final UserService userService;
    private final ChatService chatService;
    private final ChannelService channelService;
    private final StreamingService streamingService;

    @PostMapping("/on")
    public String StreamingOn(Model model, StreamingOnDto streamingOnDto) {

        if (SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {

            // 로그인한 사용자
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();
            log.info("username = {}", username);

            // 로그인한 사용자의 정보
            UserAccountEntity user = userService.findUserByUserName(username);
            model.addAttribute("userAccount", user);
            model.addAttribute("streamer", user);

            // 로그인한 사용자의 채널 정보
            ChannelEntity channel = channelService.findChannelByUserAccount(user);
            channel.setStreamingState(StreamingState.ON);
            channelService.update(streamingOnDto);
            
            // 업데이트 후 다시 불러오기
            channel = channelService.findChannelByUserAccount(user);
            
            log.info("channel = {}", channel);
            model.addAttribute("channel", channel);
            Long channelId = channel.getChannelId();


            ChatRoom room = chatService.findRoomById(channelId);

            log.info("room = {}", room);
            model.addAttribute("room", room);

            // 스트리머의 스트림키를 기반으로 스트리밍 URL 생성
            String streamingKey = user.getUserStreamingKey(); // 스트리머의 스트리밍 키를 가져온다.
            log.info("streamingKey = {}", streamingKey);
            String streamingUrl = String.format("http://localhost:8088/streaming/hls/%s.m3u8", streamingKey); // 스트리밍 URL 동적 생성
            model.addAttribute("streamingUrl", streamingUrl);

            // TODO: 브로드캐스트 상태를 온으로 만들고 팔로워에게 알림을 보내도록
            
            String status = channel.getStreamingStateSet().toString();
            model.addAttribute("status", status);

            return "/channel";
        }
        return "/";
    }

    @PostMapping("/off")
    public String broadcastOff() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        UserAccountEntity user = userService.findUserByUserName(username);

        ChannelEntity channel = channelService.findChannelByUserAccount(user);
        channel.setStreamingState(StreamingState.OFF);
        channelService.save(channel);

        return "redirect:/";
    }

    @GetMapping("/generate-streaming-key")
    public ResponseEntity<?> generateStreamingKey(Authentication authentication) {
        String userName = authentication.getName();
        String streamingKey = streamingService.generateStreamingKey();

        // 로그 추가: 스트리밍 키 발급 로그
        log.info("스트리밍 키를 발급받았습니다. userName: {}, streamingKey: {}", userName, streamingKey);

        return ResponseEntity.ok().body(Map.of("streamingKey", streamingKey));
    }

    @PostMapping("/validate-streaming-key")
    public ResponseEntity<?> validateStreamingKey(@RequestBody Map<String, String> streamingKeyRequest) {
        log.info("Received streaming key validation request: {}", streamingKeyRequest);
        String streamingKey = streamingKeyRequest.get("streamingKey");
        boolean streamingKeyIsValid = streamingService.validateStreamingKey(streamingKey);
        if (streamingKeyIsValid) {
            // 로그 추가: 스트리밍 키 유효성 검사 성공 로그
            log.info("스트리밍 키 유효성 검사가 성공했습니다. streamingKey: {}", streamingKey);

            return ResponseEntity.ok().build();
        } else {
            // 로그 추가: 스트리밍 키 유효성 검사 실패 로그
            log.warn("스트리밍 키 유효성 검사가 실패했습니다. streamingKey: {}", streamingKey);

            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }
}
