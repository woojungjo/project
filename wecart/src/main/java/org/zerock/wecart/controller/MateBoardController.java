package org.zerock.wecart.controller;

import java.util.List;
import java.util.Objects;

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
import org.zerock.wecart.domain.mateboard.MateBoardVO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.board.mateboard.MateBoardService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/board/mate")
@Controller
public class MateBoardController {		//JavaBeans, POJO


	//Spring Framework v4.3이후부터는 아래와 같은 조건 시, 자동 주입
	//즉 @Setter(onMethod_= @Autowired)하지 않아도 됨
//	(1) 주입받을 필드가 오직 1개이고,
//	(2) 이 필드를 매개변수로 가지는 생성자가 있다면
	@Setter(onMethod_= @Autowired)
	private MateBoardService service;
	
	@GetMapping("/matelist")
	public void mateList(Criteria cri, Model model) throws ControllerException{ //게시판 전체 목록 조회 요청 처리 핸들러
		log.trace("matelist({}, {}) invoked", cri, model);
		
		//게시판 전체 목록 로직을 처리하는 메소드가 비즈니스계층에 있기 때문에
		//이 주입받은 service객체를 가지고 하면 된다.
		Objects.requireNonNull(this.service);
		log.info("\t+this.service:{}", this.service);
		
		try {
			//Step1. 페이징 처리된 현재 currPage에 해당하는게시글 목록 받아옴 
			List<MateBoardVO> list = this.service.getList(cri);
			model.addAttribute("__MATE_LIST__", list);
			
			//Step2. Pagination 위한 각종 변수값 계산 
			int totalAmount = this.service.getTotalAmount();
			PageDTO pageDTO = new PageDTO(cri, totalAmount); //모든 값은 이미 필드에 계산되어 있음
			
			log.info("\t+pageDTO: {}", pageDTO);
			//모델상자 안에 넣을 pageDTO
			model.addAttribute("__PAGE_MAKER__", pageDTO);
		}catch (Exception e) {
			throw new ControllerException(e);
		}
	}//list()

	//reuqstURI에서 특정 경로에 있는 단어를 내가 매개변수에다가 집어 넣어주기 
	@GetMapping(path="/mateget/{post_no}")
	public String mateGet(@PathVariable("post_no") Integer post_no, Model model)throws ControllerException {
		log.trace("mateget({}, {}) invoked", post_no, model);
		
		try {
			MateBoardVO vo = this.service.get(post_no);
			model.addAttribute("__MateBoard__", vo);
			
			return "/board/mate/mateget";
		}catch(Exception e) {
			throw new ControllerException(e);
		}//try-catch

	}//mateGet()
	
	@GetMapping("/matemodify")
	public void mateModify() {
		log.trace("matemodify() invoked");
	}//mateModify() 
	
	@PostMapping("/matemodify")
	public String mateModify(RedirectAttributes rttrs) {
		log.trace("matemodify({}) invoked", rttrs);
		
		return "redirect:/board/mateboard/matelist";
		
	}//mateModify()
	
	
	@PostMapping("/mateRemove")
	public String mateRemove(RedirectAttributes rttrs) {
		log.trace("mateRemove({}) invoked", rttrs);
		
		return "redirect:/board/mateboard/matelist";
	}//mateRemove()
	
}//MateBoardController
