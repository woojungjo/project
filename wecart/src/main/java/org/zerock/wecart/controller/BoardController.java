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

@RequestMapping("/board")
@Controller
public class BoardController {

	
	@GetMapping("/register")
	public void boardRegister(){
		log.trace("boardRegister() invoked");
	}//boardRegister()
	
	@PostMapping()
	public String boardRegister(RedirectAttributes rttrs){
		log.trace("boardRegister() invoked");
		
		return "redirect:/board/mateboard/matelist";
	}//boardRegister()

}
