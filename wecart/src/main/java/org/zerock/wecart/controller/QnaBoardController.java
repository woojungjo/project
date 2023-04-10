package org.zerock.wecart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.PageDTO;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.board.qnaboard.QnaBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

//@NoArgsConstructor
@AllArgsConstructor
@Log4j2

@RequestMapping("/board/qna")
@Controller
// 아래 어노테이션의 배열({속성명1, 속성명2,....})에 지정한 모델 속성들은 
// 자동으로 세션에도 저장하게 해주는 어노테이션 입니다.
@SessionAttributes({"board", "boardDTO"})
public class QnaBoardController {
	
//	@Setter(onMethod_= @Autowired)
	// Spring Framework v4.3 이후부터는, 아래와 같은 조건 시, 자동주입됨
	// 1. 주입받을 필드가 오직 1개이고
	// 2. 이 필드를 매개변수로 가지는 생성자가 있다면
	private QnaBoardService service;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) throws ControllerException { // 게시판 전체목록조회 요청 처리 핸들러
		log.trace("list({}, {}) invoked.", cri, model);
		
		try {
			// Step.1 페이징처리된 현재 currPage에 해당하는 게시글목록을 받아옴
			List<QnaBoardVO> list = this.service.getList(cri);
			model.addAttribute("list", list);
			
			// Step.2 Pagination을 위한 각종 변수값을 계산
			int totalAmount = this.service.getTotalAmount();
			PageDTO pageDTO = new PageDTO(cri, totalAmount);
			log.info("\t+ pageDTO : {}", pageDTO);
			
			model.addAttribute("pageMaker", pageDTO);
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
			
	} // list
	
} // end class
