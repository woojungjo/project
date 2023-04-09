package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/priceCompare")
@Controller
public class PriceCompareController {
	
	@GetMapping("/list")
	public void list() {
		log.trace("list() invoked.");		
	} //list
	
	@GetMapping("/search")
	public void search(String search_item) {
		log.trace("search() invoked.");
		log.info("\t+ search_item: {}", search_item);
	} //search

	
} //end class
