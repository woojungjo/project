package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/priceCompare")
@Controller
public class PriceCompareController {

	//테스트중//jh
	//테스트2
	//테스트3
	//테스트4
	@GetMapping("/list")
	public void list() {
		log.trace("list() invoked.");		
	} //list
	
	@GetMapping("/search")
	public void search(String search_item) {
		log.trace("search() invoked.");
		log.info("\t+ search_item: {}", search_item);
	} //search

	
	// 한 상품을 디테일하게 보여줌
	// showPrd/{mainCategory} 식으로 보여줘야 할 것 같음 => RestFUL API 공부 후 파악하기
	@GetMapping("/showPrd")
	public void priceCompare() {
		log.trace("showPrd() invoked. ");
		
	} // priceCompare   Jhwan
	
	// 카트를 누르면 상품을 오늘의 카트에 담는다.
	@PostMapping("/addPrdToCart")
	public void addPrdToCart() {
		log.trace("addPrdToCart() invoked. ");
		
		
	} // addPrdToCart   Jhwan
	
	// 해당 상품을 찜할 수 있음
	@PostMapping("/addPrd")
	public String addPrd() {
		log.trace("addPrd() invoked. ");
		
		return "redirect:showPrd";
	} // addPrd   Jhwan
	
	
	public void hello() {
		//git test용 함수 ㅇㅇㅇㅇ
	}// 
} //end class
