package org.zerock.wecart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
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
	public GoodsVO register(Model model) throws ServiceException{
		log.trace("register({}) invoked.", model);
		
		Integer goods_id = (Integer)model.getAttribute("goods_id");
		log.trace("goods_id: {}", goods_id);
		
		GoodsVO goodsVO = service.select(goods_id);
		
		UserVO userVO = (UserVO)model.getAttribute("__AUTH__");
		log.trace("UserVO: {}", userVO);
		
		return goodsVO;
	} //register
	
//	@PostMapping("/remove")		Ajax일 때 PostMapping으로
	@GetMapping("/remove")		//현재 확인단계일 때만 임시로 겟매핑
	public String remove() {
		log.trace("remove() invoked.");
		
		return "redirect:cartList";
	} //remove
} //end class
