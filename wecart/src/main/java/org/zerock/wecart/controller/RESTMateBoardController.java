package org.zerock.wecart.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.wecart.domain.board.MateBoardCommentDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.board.mateboard.MateBoardCommentService;
import org.zerock.wecart.service.board.mateboard.MateBoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@AllArgsConstructor

@RequestMapping("/board/mate")
@RestController
public class RESTMateBoardController {
	
	@Setter(onMethod_= {@Autowired})
	
	private MateBoardService service;
	@Setter(onMethod_= {@Autowired})
	
	private MateBoardCommentService commentService;
	
	@PostMapping(value = "/read/commentwrite", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Boolean commentWrite(@RequestBody MateBoardCommentDTO dto) throws ControllerException {
		
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
	
	@PostMapping("/read/commentlike")
	public Boolean commentLike(@RequestBody MateBoardCommentDTO dto) throws ControllerException {
		try {
		
			this.commentService.commentLike(dto);
			
			return true;
		} catch(Exception e) {
			throw new ControllerException(e);
		}
	}
	
	@PostMapping("/read/commentupdate")
	public Boolean commentUpdate(@RequestBody MateBoardCommentDTO dto) throws ControllerException {
		try {
			
			this.commentService.commentModify(dto);
			
			return true;
		} catch(Exception e) {
			throw new ControllerException(e);
		}
	}

	
} // end class
