package org.zerock.wecart.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.wecart.domain.pricecompare.RestAmount;
import org.zerock.wecart.domain.pricecompare.RestGoods;
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
	
	//1. 상품 개별 삭제
	@DeleteMapping(value = "/remove/{member_id}/{goods_id}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("goods_id") Integer goods_id, @PathVariable("member_id") Integer member_id) throws ControllerException{
		try {
			log.trace("remove({}, {}) invoked.", goods_id, member_id);
			
			return this.service.remove(goods_id, member_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
			        										: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
	} //remove
	
	//2. 상품 선택 삭제
	@DeleteMapping(value = "/remove/{member_id}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeChecked(@RequestBody RestGoods goods, @PathVariable("member_id") Integer member_id) throws ControllerException {
		try {
			log.trace("removeChecked({}, {}) invoked.", goods, member_id);
			
			int[] goodsIdArr = goods.getGoodsIdArr();
			
			return this.service.removeChecked(goodsIdArr, member_id) >= 1 ? new ResponseEntity<>("success", HttpStatus.OK)
																	 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
	} //removeChecked
	
	//4. 상품 수량 변화
	@PutMapping(value = "/modifyAmount/{member_id}/{goods_id}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyAmount(@PathVariable("goods_id") Integer goods_id, @PathVariable("member_id") Integer member_id, @RequestBody RestAmount restAmount) throws ControllerException {
		try {
			log.trace("modifyAmount({}, {}, {}) invoked.", member_id, goods_id, restAmount);
			
			Integer amount = restAmount.getAmount();
			
			return this.service.modifyAmount(amount, goods_id, member_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					 														   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
	} //modifyAmount
} //end class






