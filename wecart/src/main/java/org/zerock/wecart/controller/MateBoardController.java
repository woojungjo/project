package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/board/mateboard")
@Controller
public class MateBoardController {		//JavaBeans, POJO

	@GetMapping("/matelist")
	public void mateList() {
		log.trace("list() invoked");
	}//list
	
	@GetMapping("/mateget")
	public void mateGet() {
		log.trace("get() invoked");
	}//get
	
	@GetMapping("/matemodify")
	public void mateModify() {
		log.trace("modify() invoked");
	}//modify 
	
	@PostMapping("/matemodify")
	public String mateModify(RedirectAttributes rttrs) {
		log.trace("modify({}) invoked", rttrs);
		
		return "redirect:/board/mateboard/matelist";
		
	}//modify 
	
	
	@PostMapping("/mateRemove")
	public String mateRemove() {
		log.trace("mateRemove() invoked");
		
		return "redirect:/board/mateboard/matelist";
	}//remove 
	
}//MateBoardController
