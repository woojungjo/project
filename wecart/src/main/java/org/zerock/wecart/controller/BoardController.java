package org.zerock.wecart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.mateboard.MateBoardDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.board.mateboard.MateBoardService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private MateBoardService service;

	@GetMapping("/register")
	public void boardRegister(){
		log.trace("boardRegister() invoked");
	}//boardRegister()

	@PostMapping("/register")
	public String boardRegister(RedirectAttributes rttrs, MateBoardDTO dto, Criteria cri, 
			@RequestBody String test
			) throws ControllerException{
		//log.trace("boardRegister({}, {}, {}) invoked", rttrs, dto, cri);
		log.trace("arr:{}",test);
		/*
		try {
			boolean success = this.service.register(dto);
			log.info("\t+success",success);
			
			//페이징처리용 전송파라미터도 함께 전송처리 //
			rttrs.addAttribute("currPage", cri.getCurrPage());
			rttrs.addAttribute("amount", cri.getAmount());
			 
			//Model 전송처리 , 비즈니스 요청처리용 전송파라미터 전송처리
			rttrs.addAttribute("result", (success)? "success": "failure");
			
			return "redirect:/board/mate/matelist";
		}catch(Exception e) {
			throw new ControllerException(e);
		}//try-catch 
		*/
		return null;
	}//boardRegister()

}
