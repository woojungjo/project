package org.zerock.wecart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.wecart.domain.board.QnaBoardCommentDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.board.qnaboard.QnaBoardCommentService;
import org.zerock.wecart.service.board.qnaboard.QnaBoardService;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@AllArgsConstructor
@Log4j2

@RequestMapping("/board/qna")
@RestController
public class RESTQnaBoardController {
	
	@Setter(onMethod_= {@Autowired})
	
	private QnaBoardService service;
	@Setter(onMethod_= {@Autowired})
	
	private QnaBoardCommentService commentService;
	
//	@PostMapping("/read/commentwrite")
	@PostMapping(value = "/read/commentwrite", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Boolean commentWrite(@RequestBody QnaBoardCommentDTO dto) throws ControllerException {
		
		try {
			
			
			commentService.register(dto);
			
			return true;
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // read
	
	@PostMapping("/read/commentdelete")
	public Boolean commentDelete(@RequestBody Map<String, String> requestBody) throws ControllerException {
	    try {
	        String comment_no = requestBody.get("comment_no");

	        commentService.remove(Integer.parseInt(comment_no));

	        return true;
	    } catch(Exception e) {
	        throw new ControllerException(e);
	    }
	}

	
} // end class
