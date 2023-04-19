package org.zerock.wecart.controller;

import java.util.HashMap;
import java.util.List;

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
import org.zerock.wecart.service.pricecompare.PriceCompareService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@NoArgsConstructor
@Log4j2

@SessionAttributes("__AUTH__")
@RequestMapping("/todayCart")
@Controller
public class TodayCartController {

	@Setter(onMethod_=@Autowired)
	PriceCompareService service;
	
	@GetMapping("/cartList")
	public void cartList() {
		log.trace("cartList() invoked.");
	} //get
	
	@PostMapping("/register")
	@ResponseBody
	public String register(Model model, @RequestBody HashMap<String, Integer> map ) throws ServiceException{
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
		
		
		
		// cart_id들 중에 
		// (1) status == "NotYet"이 있으면 
		//	 => 해당 장바구니 번호와 현재 goods_id를 추가 
		// (2) status가 모두 "Installed"면 
		// 	 => 장바구니 테이블에서 장바구니를 만들고 
		// 	 => 해당 장바구니와 goods_id와 회원 id를 넣어서 member_goods_cart 추가
		
		return "Success";
	} //register
	
//	@PostMapping("/remove")		Ajax일 때 PostMapping으로
	@GetMapping("/remove")		//현재 확인단계일 때만 임시로 겟매핑
	public String remove() {
		log.trace("remove() invoked.");
		
		return "redirect:cartList";
	} //remove
} //end class
