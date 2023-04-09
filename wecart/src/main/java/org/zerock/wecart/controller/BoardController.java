package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/board")
@Controller
public class BoardController {

	@RequestMapping(
			path= {"/register"},
			method= {
					RequestMethod.GET,
					RequestMethod.POST	
			})
	public void boardRegister(){
		log.trace("boardRegister() invoked");
	}//boardRegister()
}
