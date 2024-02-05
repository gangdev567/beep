package com.itwill.beep.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
<<<<<<< HEAD

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	
	@GetMapping("/test123")
	public void test() {
		log.info("test()");
	}
=======
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class TestController {

    @GetMapping("/followtestpage")
    public void test() {

    }
>>>>>>> e025b70abc8509938310cf5dc8449a91139df588

}
