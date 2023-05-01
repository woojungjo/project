package org.zerock.wecart.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/rest")
@RestController
public class DetailMyPageCartRestController {

	@GetMapping(value = "/cart_id/{cart_id}", consumes = "application/json", produces = "application/json")
	public void getGoodsPrices(@PathVariable("cart_id") Integer cart_id) {
		log.trace("getGoodsPrices({}) invoked.", cart_id);
	} //getGoodsPrices
	
} //end class
