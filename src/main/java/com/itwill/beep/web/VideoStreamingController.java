package com.itwill.beep.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VideoStreamingController {

	@GetMapping("/stream")
	public String streamingPage(Model model) {
		// WSL에서 Nginx 서버의 IP 주소와 HLS 파일 경로를 model에 추가
		model.addAttribute("videoSrc", "http://192.168.20.25:8088/stream/hls/live.m3u8");
		return "streaming";
	}
}