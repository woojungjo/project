package org.zerock.wecart.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.PageDTO;
import org.zerock.wecart.domain.board.QnaBoardCommentVO;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.mapper.board.qnaboard.QnaBoardMapper;
import org.zerock.wecart.service.board.qnaboard.QnaBoardCommentService;
import org.zerock.wecart.service.board.qnaboard.QnaBoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@AllArgsConstructor
@Log4j2

@RequestMapping("/board/qna")
@Controller
//@SessionAttributes({"board", "boardDTO"})
public class QnaBoardController {
	
	@Setter(onMethod_= {@Autowired})
	
	private QnaBoardService service;
	@Setter(onMethod_= {@Autowired})
	
	private QnaBoardCommentService commentService;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) throws ControllerException {
		log.trace("list({}, {}) invoked.", cri, model);
		
		try {
			List<QnaBoard_CommentCountVO> list = this.service.getList(cri);
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
			QnaBoardVO readVO = this.service.get(post_no);
			model.addAttribute("readVO", readVO);
			
			List<QnaBoardCommentVO> commentVO = this.commentService.getList(post_no);
			model.addAttribute("commentVO", commentVO);
			
			Integer commnetCnt = this.commentService.getTotalAmount(post_no);
			model.addAttribute("commnetCnt", commnetCnt);
			
			
			return "/board/qna/read";
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // read
	
} // end class
