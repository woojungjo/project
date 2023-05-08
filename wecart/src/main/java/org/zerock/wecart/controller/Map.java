package org.zerock.wecart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.wecart.domain.pricecompare.RetailVO;
import org.zerock.wecart.service.pricecompare.MypageCartService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2


@RequestMapping("/map")
@Controller
public class Map {
	
	@Setter(onMethod_=@Autowired)
	MypageCartService service;
	
	
	// 내 주변의 마트를 보여주는 역할을 함
	@GetMapping("/locationOfMarts")
	public String locationOfMarts(@RequestParam("retail_name") String retail_name, 
			ModelAndView mav,
			Model model
			) throws Exception{
		log.trace("locationOfMarts() invoked. ");
		
		log.trace("PriceDTO dto: {}", retail_name);
		
		RetailVO retail = this.service.returnRetailVOWithRetailName(retail_name);
		
		String retailValue = retail_name;  //+ " " + retail.getRetail_addr();
		
		model.addAttribute("__RETAILNAME__", retailValue);
		
//		mav.setViewName("/map/locationOfMarts");
//		mav.addObject("__RETAILNAME__", retailName);
		
		return "/map/locationOfMarts";
	} // locationOfMarts   jhwan
} // Mypage
