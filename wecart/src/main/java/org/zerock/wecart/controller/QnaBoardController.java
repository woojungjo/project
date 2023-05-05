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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.PageDTO;
import org.zerock.wecart.domain.board.QnaBoardCommentVO;
import org.zerock.wecart.domain.board.QnaBoardDTO;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;
import org.zerock.wecart.exception.ControllerException;
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
			
			// 현재시간 확인
	        Date now = new Date();   
	        model.addAttribute("currentTime", now);
			
			return "/board/qna/read";
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // read
	
	@GetMapping("/modify/{post_no}")
	public void modify(@PathVariable Integer post_no, Model model) throws ControllerException {
		log.trace("read({}, {}) invoked.", post_no, model);
		
		try {
			QnaBoardVO readVO = this.service.get(post_no);
			model.addAttribute("readVO", readVO);
		
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // modify
	
	@PostMapping("/modify/{post_no}")
	public String modify(Criteria cri, QnaBoardDTO dto, RedirectAttributes rttrs)  throws ControllerException{
	
			log.trace("modify:{},{}, {}", cri, dto, rttrs);
			
			try {
				boolean success =this.service.modify(dto);
				log.info("\t+success:{}", success);
				
				//페이징처리용 전송파라미터도 함게 전송처리
				rttrs.addAttribute("currPage", cri.getCurrPage());
				rttrs.addAttribute("amount", cri.getAmount());
				
				//Model 전송처리 
				rttrs.addAttribute("result", (success)? "success": "failure");
				
				return "redirect:/board/qna/list";
				
			}catch(Exception e) {
				throw new ControllerException(e);
			}//try-catch
			
	}//modify()
	
	@PostMapping("/delete")
	public String delete(Integer post_no) throws ControllerException {
		
		try {
			
			this.service.remove(post_no);
			
			return "redirect:/board/qna/list";
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // delete
	
	
	
} // end class
