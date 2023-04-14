package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.service.user.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@RequestMapping("/user")
@Controller
public class UserController {
	
	private UserService service;
	
	@PostMapping("/loginPost")
	public String loginPost(LoginDTO dto, RedirectAttributes rttrs, Model model) throws ControllerException{
		
		try {
			UserVO vo = this.service.login(dto);
			log.info("\t+ vo: {}", vo);
			
			if(vo != null) {
				model.addAttribute("__AUTH__", vo);
				
//				model.addAttribute("alias", vo.getAlias() );
				
				return null;
			} else {
				rttrs.addAttribute("result", "Login Failed");
				
				return "redirect:/user/login";
			} // if - else
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch
	} // loginPost
	

	@GetMapping("/logout")
	public void logout() {
		log.info("오류 메시지");
		
	} // logout
	
	@GetMapping("/signup")
	public String signup() {
		
		return null;
	} // signup
	
	@GetMapping("/signupTerms")
	public String signupTerms() {
		
		return null;
	} // signup
	
	@GetMapping("/findAccount")
	public void findAccount() {
		
	} // findAccount
	
	@PostMapping("/serachId")
	@ResponseBody
	public String searchId(@RequestParam("alias") String alias, @RequestParam("email") String email) throws ControllerException {
		try {
			String result = this.service.searchId(alias, email);
			
			return result;
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch		
	} // searchId
	
} // end class
