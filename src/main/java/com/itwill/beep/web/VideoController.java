package com.itwill.beep.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VideoController {

	@GetMapping("/video")
	public String video(Model model) {
		// 여기에 HLS 스트림 URL을 설정
		model.addAttribute("videoSrc", "/videos/test.m3u8");
		return "video";
	}

}