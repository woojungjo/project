package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@RequestMapping("/mypage/edit")
@Controller
public class MypageEditController {
	
	@GetMapping("/check_password")
	public String password() {
		
		return null;
	}
	
	@GetMapping("/account")
	public String editAccount() {
		
		return null;
	}
	
	@GetMapping("/change_password")
	public String changePassword() {
		
		return null;
	}
	
	@GetMapping("/withdrawal_account")
	public String withdrawal() {
		
		return null;
	}

} // end class
