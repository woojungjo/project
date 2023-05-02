package org.zerock.wecart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.wecart.domain.board.BoardDTO;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardDTO;
import org.zerock.wecart.domain.mateboard.MateBoardDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.board.mateboard.MateBoardService;
import org.zerock.wecart.service.board.qnaboard.QnaBoardService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/board")

@Controller
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private MateBoardService mateService;
	@Setter(onMethod_= @Autowired)
	private QnaBoardService qnaService;

	@GetMapping("/register")
	public void boardRegister(){
		log.trace("boardRegister() invoked");
	}//boardRegister()

	@PostMapping("/register")
	public String boardRegister(RedirectAttributes rttrs, BoardDTO dto, Criteria cri
			) throws ControllerException{
		
		try {
			if(dto.getSortOfBoard()==6) {
				
				QnaBoardDTO qnaBoardDTO = new QnaBoardDTO();
				qnaBoardDTO.setContent(dto.getContent());
				qnaBoardDTO.setMember_id(dto.getMember_id());
				qnaBoardDTO.setPost_no(dto.getPost_no());
				qnaBoardDTO.setSecret_yn(dto.getSecret_yn());
				qnaBoardDTO.setTitle(dto.getTitle());
				qnaBoardDTO.setViews(dto.getViews());
			
				this.qnaService.register(qnaBoardDTO);
				
				return "redirect:/board/qna/list";
				
			}else if(dto.getSortOfBoard()==3) {
	
					MateBoardDTO mateBoardDTO = new MateBoardDTO();
					//log.trace("dto.getMeeting_time_temp(): {}", dto.getMeeting_time_temp());
					//java.time.LocalDateTime
					//log.trace("dto.getMeeting_time_temp(): {}", dto.getMeeting_time_temp().getClass().getName());
					
//					Timestamp timestamp = Timestamp.valueOf(dto.getMeeting_time_temp());
					
//					log.trace("timestamp(): {}", timestamp.getClass().getName());//java.sql.Timestamp
					
//					mateBoardDTO.setPost_no(dto.getPost_no());
					mateBoardDTO.setMember_id(dto.getMember_id());
					mateBoardDTO.setTitle(dto.getTitle());
					mateBoardDTO.setContent(dto.getContent());
					mateBoardDTO.setViews(dto.getViews());
					mateBoardDTO.setReport_cnt(dto.getReport_cnt());
					mateBoardDTO.setMeeting_status(dto.getMeeting_status());
					mateBoardDTO.setMeeting_area(dto.getMeeting_area());
					mateBoardDTO.setMeeting_time(dto.getMeeting_time());
					mateBoardDTO.setParticipant_id_1(dto.getParticipant_id_1());
					mateBoardDTO.setParticipant_id_2(dto.getParticipant_id_2());
					mateBoardDTO.setParticipant_id_3(dto.getParticipant_id_3());
					
					log.info("mateBoardDTO:{}", mateBoardDTO);
					this.mateService.register(mateBoardDTO);
					
					return "redirect:/board/mate/matelist";
				}//if
			}catch(Exception e) {
					throw new ControllerException(e);
			}//try-catch 
		return "redirect:/board/register";
	}//boardRegister()
}	
