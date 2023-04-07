package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@NoArgsConstructor
@Log4j2

@RequestMapping("/todayCart")
@Controller
public class TodayCartController {

	@GetMapping("/cartList")
	public void cartList() {
		log.trace("cartList() invoked.");
	} //get
	
	@PostMapping("/register")
	public String register() {
		log.trace("register() invoked.");
		
		return "redirect:cartList";
	} //register
	
	@PostMapping("/remove")
	public String remove() {
		log.trace("remove() invoked.");
		
		return "redirect:cartList";
	} //remove
	
} //end class
