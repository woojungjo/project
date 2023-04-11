package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/mypage/cart")
@Controller
public class MypageCartController {
	@GetMapping("/get")
	public void get() {
		log.trace("get() invoked.");
	} //get
	
	@PostMapping("/remove")
	public String remove() {
		log.trace("remove() invoked.");
		
		return "redirect:/mypage/cart/list";
	} //remove
	
	@PostMapping("/currentPrice")
	public void currentPrice() {
		log.trace("currentPrice() invoked.");
	} //currentPrice
	
	// 카트 리스트들을 일주일, 한달, 3개월 6개월 순으로 보여주기
	@PostMapping("/arrangeByMonth")
	public void arrangeByMonth() {
		log.trace("arrangeByMonth() invoked. ");
	}// arrangeByMonth  jhwan
	
	// 카트 리스트 보여주기
	@GetMapping("/list")
	public void list(String period) {
		log.trace("list() invoked. ");
		log.trace("\t+ period: {} ", period);
		
		// period에 따라서 view에 보여줄 데이터 범위를 한정시킴
	} // list  jhwan
	
	// 찜한 상품들 표시
	@GetMapping("/wishedPrds")
	public void wishedPrds() {
		log.trace("wishedPrds() invoked.");
	} // wishedPrds  jhwan
	
	// 찜한 상품 삭제
	@GetMapping("/wishedPrdsRemoved")
	public String wishedPrdsRemoved() {
		log.trace("wishedPrdsRemoved() invoked. ");
		
		return "redirect:wishedPrds";
	} // wishedProdsRemoved   jhwan
} //end class
