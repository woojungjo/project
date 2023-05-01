package org.zerock.wecart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.pricecompare.DetailMyPageCartService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/mypageCart")
@RestController
public class DetailMyPageCartRestController {

	private DetailMyPageCartService service;
	
	@Autowired
	public DetailMyPageCartRestController(DetailMyPageCartService service) {
		this.service = service;
	} //Constructor
	
	@DeleteMapping(value = "/remove/cart/{cart_id}", produces= "text/plain;charset=UTF-8")
	public ResponseEntity<String> removeCart(@PathVariable Integer cart_id) throws ControllerException {
		log.trace("removeCart({}) invoked.", cart_id);
		
		try {
			return this.service.removeCart(cart_id) == 1 ? new ResponseEntity<>("장바구니가 삭제되었습니다.", HttpStatus.OK)
														 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR) ;
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
	} //removeCart
	
} //end class
