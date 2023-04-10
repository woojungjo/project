package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2


@RequestMapping("/map")
@Controller
public class Map {
	
	// 내 주변의 마트를 보여주는 역할을 함
//	@PostMapping("/locationOfMarts")
	@GetMapping("/locationOfMarts")
	public void locationOfMarts() {
		log.trace("locationOfMarts() invoked. ");
	} // locationOfMarts   jhwan
} // Mypage
