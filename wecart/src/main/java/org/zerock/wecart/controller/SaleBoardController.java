package org.zerock.wecart.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.PageDTO;
import org.zerock.wecart.domain.saleboard.SaleBoardCommentVO;
import org.zerock.wecart.domain.saleboard.SaleBoardDTO;
import org.zerock.wecart.domain.saleboard.SaleBoardListVO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.board.saleboard.SaleBoardCommentService;
import org.zerock.wecart.service.board.saleboard.SaleBoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@AllArgsConstructor
@Log4j2

@RequestMapping("/board/sale")
@Controller
//@SessionAttributes({"board", "boardDTO"})
public class SaleBoardController {
	
	@Setter(onMethod_= {@Autowired})
	
	private SaleBoardService service;
	@Setter(onMethod_= {@Autowired})
	
	private SaleBoardCommentService commentService;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) throws ControllerException {
		log.trace("list({}, {}) invoked.", cri, model);
		
		try {
			List<SaleBoardListVO> list = this.service.getList(cri);
			model.addAttribute("list", list);
			
			int totalAmount = this.service.getTotalAmount();
			PageDTO pageDTO = new PageDTO(cri, totalAmount);
			log.info("\t+ pageDTO : {}", pageDTO);
			
			model.addAttribute("pageMaker", pageDTO);
			
			// 현재시간 확인
	        Date now = new Date();   
	        model.addAttribute("currentTime", now);
	        log.info("date now : {}", now); 
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
			
	} // list
	
	@GetMapping("/read/{post_no}")
	public String read(@PathVariable Integer post_no, Model model) throws ControllerException {
		log.trace("read({}, {}) invoked.", post_no, model);
		
		try {
			SaleBoardListVO readVO = this.service.get(post_no);
			model.addAttribute("readVO", readVO);
			log.trace("like_cnt test : {}", readVO);
			
			List<SaleBoardCommentVO> commentVO = this.commentService.getList(post_no);
			model.addAttribute("commentVO", commentVO);
//			
//			Integer commnetCnt = this.commentService.getTotalAmount(post_no);
//			model.addAttribute("commnetCnt", commnetCnt);
			
			// 현재시간 확인
	        Date now = new Date();   
	        model.addAttribute("currentTime", now);
			
			return "/board/sale/read";
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // read
	
	@PostMapping("/delete")
	public String delete(Integer post_no) throws ControllerException {
		
		try {
			
			this.service.remove(post_no);
			
			return "redirect:/board/sale/list";
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // delete
	
} // end class
