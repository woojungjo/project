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
	public void remove() {
		log.trace("remove() invoked.");
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
	public void list() {
		log.trace("list() invoked. ");
	} // list  jhwan
	
	
	// 찜한 상품들 표시
	@GetMapping("/wishedPrds")
	public void wishedPrds() {
		log.trace("wishtedPrds() invoked.");
	} // wishedPrds  jhwan
	
	// 찜한 상품 삭제
	@PostMapping("/wishedPrdsRemoved")
	public void wishedProds() {
		log.trace("wishedPrdsRemoved() invoked. ");
	} // wishedProdsRemoved   jhwan
	
	
} //end class
