package org.zerock.wecart.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.wecart.domain.saleboard.SaleBoardCommentDTO;
import org.zerock.wecart.domain.saleboard.SaleBoardDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.board.saleboard.SaleBoardCommentService;
import org.zerock.wecart.service.board.saleboard.SaleBoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@AllArgsConstructor

@RequestMapping("/board/sale")
@RestController
public class RESTSaleBoardController {
	
	@Setter(onMethod_= {@Autowired})
	
	private SaleBoardService service;
	@Setter(onMethod_= {@Autowired})
	
	private SaleBoardCommentService commentService;
	
	@PostMapping(value = "/read/commentwrite", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Boolean commentWrite(@RequestBody SaleBoardCommentDTO dto) throws ControllerException {
		
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
	public Boolean commentLike(@RequestBody SaleBoardCommentDTO dto) throws ControllerException {
		try {
		
			this.commentService.commentLike(dto);
			
			return true;
		} catch(Exception e) {
			throw new ControllerException(e);
		}
	}
	
	@PostMapping("/read/commentupdate")
	public Boolean commentUpdate(@RequestBody SaleBoardCommentDTO dto) throws ControllerException {
		try {
			
			this.commentService.commentModify(dto);
			
			return true;
		} catch(Exception e) {
			throw new ControllerException(e);
		}
	}
	
	@PostMapping("/read/postlike")
	public Boolean postLike(@RequestBody SaleBoardDTO dto) throws ControllerException {
		try {
		
			this.service.postLike(dto);
			
			return true;
		} catch(Exception e) {
			throw new ControllerException(e);
		}
	}
	
	@PostMapping("/read/posthate")
	public Boolean postHate(@RequestBody SaleBoardDTO dto) throws ControllerException {
		try {
			
			this.service.postHate(dto);
			
			return true;
		} catch(Exception e) {
			throw new ControllerException(e);
		}
	}
	

	
} // end class
