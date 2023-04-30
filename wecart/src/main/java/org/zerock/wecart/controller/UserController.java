package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.SignUpDTO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.user.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@RequestMapping("/user")
@Controller
public class UserController {

	private UserService service;

	// 로그인 처리
	@PostMapping("/loginPost")
	public String loginPost(LoginDTO dto, RedirectAttributes rttrs, Model model) throws ControllerException {

		try {
			UserVO vo = this.service.login(dto);
			log.info("\t+ vo: {}", vo);

			if (vo != null) {
				model.addAttribute("__AUTH__", vo);

//				model.addAttribute("alias", vo.getAlias() );

				return null;
			} else {
				rttrs.addAttribute("result", "Login Failed");

				return "redirect:/user/login";
			} // if - else
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try - catch
	} // loginPost

	// 로그아웃
	@GetMapping("/logout")
	public void logout() {
		log.info("오류 메시지");

	} // logout

	// 회원가입
	@PostMapping("/signUp")
	public String signUp(SignUpDTO dto) throws ControllerException{
		try {
			boolean result = this.service.signUp(dto);
			log.trace("result: {}", result);
			
			return "redirect:/home";
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch
	} // signUp
	
	@GetMapping("/signUp")
	public void signUp() {
		
	} // signUp - view
	
	@GetMapping("/signUpTerms")
	public void signupTerms() {
		
	} // signUpTerms - view

	// 아이디 찾기
	@PostMapping("/searchId")
	@ResponseBody
	public String searchId(UserDTO dto) throws ControllerException {
		try {
			String result = this.service.searchId(dto);

			return result;
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // searchId

	// 비밀번호 찾기
	@PostMapping("/searchPw")
	public String searchPw(UserDTO dto) throws ControllerException {
		try {
			boolean result = this.service.searchPw(dto);
			log.trace("result: {}", result);

			return "redirect:/user/findAccount";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // searchPw
	
} // end class
