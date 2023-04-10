package org.zerock.wecart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@RequestMapping("/user")
@Controller
public class UserController {
	
	@PostMapping("/loginPost")
	public String login() {
		
		
		return null;
	} // login
	
	@GetMapping("/logout")
	@PostMapping("/logout")
	public String logout(HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
//		
//		session.invalidate();
		
		return "redirect:/";
	} // logout
	
	@GetMapping("/signup")
	public String signup() {
		
		return null;
	} // signup
	
	@GetMapping("/signupTerms")
	public String signupTerms() {
		
		return null;
	} // signup
	
} // end class
