package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/mypage/cart")
@Controller
public class MypageCartController {
	
	@GetMapping("/get")
	public void get() {
		log.trace("get() invoked.");
	} //get
	
	@PostMapping("/remove")
	public void remove() {
		log.trace("remove() invoked.");
	} //remove
	
	@PostMapping("/currentPrice")
	public void currentPrice() {
		log.trace("currentPrice() invoked.");
	} //currentPrice
} //end class
