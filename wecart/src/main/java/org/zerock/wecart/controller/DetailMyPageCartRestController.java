package org.zerock.wecart.controller;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.exception.ServiceException;
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
	
	@GetMapping(value = "/getCurrent/member/{member_id}/cart/{cart_id}/date/{api_date}", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<List<TodayCartPriceVO>>> currentPrice(@PathVariable("member_id") Integer member_id, @PathVariable("cart_id") Integer cart_id, @PathVariable("api_date") Date api_date) throws ControllerException{
		log.trace("currentPrice({}, {}, {}) invoked.", member_id, cart_id, api_date);
		
		try {			
			List<TodayCartGoodsVO> goodsList = this.service.getGoods(cart_id);
			
			List<List<TodayCartPriceVO>> priceList = goodsList.stream()
															  .map(goods -> {
															      Integer goodsId = goods.getGoods_id(); // goodsList의 요소에서 goods_id 추출
															      try {
															    	  	return this.service.getPrices(goodsId, api_date, member_id);								    	  													          
															      } catch (ServiceException e) {
															          e.printStackTrace();
															          return null;
															      }
															  })
															  .collect(Collectors.toList());
			
			return priceList != null ? new ResponseEntity<>(priceList, HttpStatus.OK)
									 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
	} //currentPrice()
	
} //end class




