package org.zerock.wecart.controller;

import java.util.Date;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/mypage/cart")
@RestController
public class RESTMypageCartController {

	@GetMapping(
		path="/baskets/{member_goods_cart_id}/dates/{cartDate}"
	)
	public ResponseEntity<String> get(
			@PathVariable("member_goods_cart_id") Integer cartId,
			@PathVariable("cartDate") Date cartDate
	) {
		log.trace("get({}, {}) invoked.", cartId, cartDate);
		
		return null;
	} //get
} //end class
