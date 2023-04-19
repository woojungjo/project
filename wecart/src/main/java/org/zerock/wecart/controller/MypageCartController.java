package org.zerock.wecart.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.service.pricecompare.MypageCartService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@SessionAttributes("__AUTH__")
@RequestMapping("/mypage/cart")
@Controller
public class MypageCartController {
	
	@Setter(onMethod_=@Autowired)
	MypageCartService service;
	
	@GetMapping("/get")
	public void get() {
		log.trace("get() invoked.");
	} //get
	
	@PostMapping("/remove")
	public String remove() {
		log.trace("remove() invoked.");
		
		return "redirect:/mypage/cart/list";
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
	public void list(String period) {
		log.trace("list() invoked. ");
		log.trace("\t+ period: {} ", period);
		
		// period에 따라서 view에 보여줄 데이터 범위를 한정시킴
	} // list  jhwan
	
	// 찜한 상품들 표시
	@GetMapping("/wishedPrds")
	public void wishedPrds() {
		log.trace("wishedPrds() invoked.");
	} // wishedPrds  jhwan
	
	/*
	 * => PriceCompareController의 /removeWishedGoods로 변경 
	// 찜한 상품 삭제
	@GetMapping("/wishedPrdsRemoved")
	public String wishedPrdsRemoved() {
		log.trace("wishedPrdsRemoved() invoked. ");
		
		return "redirect:wishedPrds";
	} // wishedProdsRemoved   jhwan
	*/
	
	@PostMapping("/saveGoodsIntoTodayCart")
	@ResponseBody
	public String saveGoodsIntoTodayCart(Model model, @RequestBody HashMap<String, Integer> map) throws ServiceException{
		log.trace("register({}) invoked.", model);
		log.trace("HashMap<String, Object> param: {}", map);
		
//	    String goods_id;
//		log.trace("goods_id: {}", goods_id);
		
		// member_id와 goods_id를 받고
		UserVO userVO = (UserVO)model.getAttribute("__AUTH__");
		Integer goods_id = map.get("goods_id");
		Integer member_id = Integer.parseInt(userVO.getMember_id()); 
		
		// 해당 회원이 가지고 있는 TodayCartId를 리턴 
		Integer todayCartId = this.service.getTodayCartIdOfMember(member_id);
		
		// 만약 TodayCartId가 반환되면
		if(todayCartId != null) {
			// (1) member_id, goods_id, TodayCart_id로 member_goods_cart 테이블을 생성
			this.service.saveGoodsIntoTodayCart(member_id, goods_id, todayCartId);
			// return true;
		} 
		// 만약 가지고 있는 TodayCart가 없다면.
		else {
			// (1) TodayCart 생성
			
			
			// (2) TodayCart_id를 받고
			// (3) member_id, goods_id, TodayCart_id로 member_goods_cart 테이블을 생성
			// return true;
		} // if - else
		
		return "Successfully save goods into todayCart";
	} //saveGoodsIntoTodayCart
	
	// 해당 상품을 찜할 수 있음
//	@PostMapping("/addPrd")
	@PostMapping("/saveGoodsIntoWishedGoods")
	@ResponseBody
	public String saveGoodsIntoWishedGoods(Model model, @RequestBody HashMap<String, Integer> goods) throws ServiceException{
		log.trace("saveGoodsIntoWishedGoods() invoked. ");
		
		try {
			Integer goods_id = goods.get("goods_id");
			UserVO userVO = (UserVO)model.getAttribute("__AUTH__");
			Integer member_id = Integer.parseInt(userVO.getMember_id());
			
			this.service.saveGoodsIntoWishList(member_id, goods_id);
			
			return "Successfully save goods into wishList"; 
		}catch(Exception e) {
			throw new ServiceException(e);
		}
		
		
	} // addPrd Jhwan
	
	// 찜한 상품 삭제
	@PostMapping("/removeWishedGoods")
	@ResponseBody
	public String removeWishedGoods(Model model, @RequestBody HashMap<String, Integer> goods) throws ServiceException{
		log.trace("removeWishedGoods() invoked. ");
		
		try {
			Integer goods_id = goods.get("goods_id");
			UserVO userVO = (UserVO)model.getAttribute("__AUTH__");
			Integer member_id = Integer.parseInt(userVO.getMember_id());
			
			this.service.deleteGoodsFromWishList(member_id, goods_id);
			
			return "Successfully save goods into wishList";
		}catch(Exception e) {
			throw new ServiceException(e);
		}
	} // wishedProdsRemoved   jhwan
} //end class
