package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.mypage.edit.EditService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@RequestMapping("/mypage/edit")
@Controller
public class MypageEditController {

	private EditService service;

	// 비밀번호 확인
	@PostMapping("/checkUser")
	public String checkUser(LoginDTO dto, Model model) throws ControllerException {
		try {
			UserVO vo = this.service.checkUser(dto);
			log.trace("vo: {}", vo);

			if (vo != null) {
				model.addAttribute("__CHECK__", vo);

				return "redirect:/mypage/edit/account";
			} else {
				
				return null;
			} // if - else
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // checkUser

	// 비밀번호 확인 화면
	@GetMapping("checkUser")
	public void checkUser() {
		;;
	} // checkUser - view

	// 닉네임, 이메일 변경
	@PostMapping("/changeUser")
	public String changeUser(@SessionAttribute("__AUTH__") UserVO vo, UserDTO dto, Model model) throws ControllerException {
		try {
			dto.setLogin_id(vo.getLogin_id());
			
			boolean result = this.service.changeUser(dto);
			log.trace("result: {}", result);
			
			// 회원정보 수정 반영 부분
			LoginDTO check = new LoginDTO();
			
			check.setLogin_id(vo.getLogin_id());
			check.setPwd(vo.getPwd());
			
			 // 수정된 회원 정보를 DB에서 다시 가져옴
	        UserVO updatedVO = this.service.checkUser(check);
	        
	        // 세션에도 수정된 회원 정보를 저장
	        model.addAttribute("__AUTH__", updatedVO);

			return "redirect:/mypage/edit/account";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // checkPw
	
	@PostMapping("/changePw")
    public String changePw(
    		@SessionAttribute("__AUTH__") UserVO vo,
    		UserDTO dto,
    		@RequestParam("old_pwd") 		String old_pwd,
            @RequestParam("pwd") 			String pwd,
            @RequestParam("confirm_pwd")	String confirm_pwd,
            Model model
    ) throws ControllerException {
		
		try {
			dto.setLogin_id(vo.getLogin_id());
			
			if ( !old_pwd.equals(vo.getPwd() )) {
	            model.addAttribute("errorMessage", "기존 비밀번호가 일치하지 않습니다.");
	            return "redirect:/mypage/edit/changePw";
	        } // if
	        if ( !pwd.equals(confirm_pwd) ) {
	            model.addAttribute("errorMessage", "새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
	            return "redirect:/mypage/edit/changePw";
	        } // if
	        if ( pwd.equals(vo.getPwd() )) {
	        	model.addAttribute("errorMessage", "변경하려는 비밀번호가 기존 비밀번호와 일치 합니다.");
	            return "redirect:/mypage/edit/changePw";
	        } // if

	     boolean result = this.service.changePw(dto);
	     log.trace("result: {}", result);
	     
	     // 회원정보 수정 반영 부분
	     LoginDTO check = new LoginDTO();
	     			
	     check.setLogin_id(vo.getLogin_id());
	     check.setPwd(dto.getPwd());
	     			
	     // 수정된 회원 정보를 DB에서 다시 가져옴
	     UserVO updatedVO = this.service.checkUser(check);
	     	        
	     // 세션에도 수정된 회원 정보를 저장
	     model.addAttribute("__AUTH__", updatedVO);

	     return "redirect:/mypage/edit/account";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
    } // changePwPost
	
	// 비밀번호 변경 화면
	@GetMapping("changePw")
	public void changePw() {
		;;
	} // changePw - view

	// 휴대전화 인증
//	public String authMobileNum(UserDTO dto) throws ControllerException {
//		try {
//			boolean result = this.service.authMobileNum(dto);
//			log.trace("result: {}", result);
//
//			return "redirect:/edit/account";
//	} // authMobileNum

	// 회원 탈퇴 화면
	@GetMapping("withdrawal")
	public void withdrawal() {
		;;
	} // withdrawal - view

	// 회원 탈퇴
//	@GetMapping("/withdrawal")
//	public String withdrawal(Integer member_id) throws ControllerException {
//		try {
//			boolean result = this.service.withdrawal(member_id);
//			log.trace("result: {}", result);
//
//			return "redirect:/";
//		} catch (Exception e) {
//			throw new ControllerException(e);
//		} // try-catch
//	} // withdrawal

} // end class
