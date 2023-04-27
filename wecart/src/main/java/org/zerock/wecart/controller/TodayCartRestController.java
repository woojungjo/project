package org.zerock.wecart.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.pricecompare.TodayCartService;

import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/todayCart")
@Log4j2
public class TodayCartRestController {

	private TodayCartService service;
	
	public TodayCartRestController(TodayCartService service) {
		this.service = service;
	} //Constructor
	
	@DeleteMapping("/remove/{member_id}/{goods_id}")
	public ResponseEntity<String> remove(@PathVariable("goods_id") Integer goods_id, @PathVariable("member_id") Integer member_id) throws ControllerException{
		try {
			log.trace("remove(goods_id) invoked.");
			
			log.info("\t+ goods_id: {}", goods_id);
			
			return service.remove(goods_id, member_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
			        										: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		
	} //remove
} //end class
