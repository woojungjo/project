package org.zerock.wecart.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.pricecompare.CartUserDTO;
import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.service.pricecompare.TodayCartService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@NoArgsConstructor
@Log4j2

@RequestMapping("/todayCart")
@Controller
public class TodayCartController {

	private TodayCartService service;
	
	@Autowired
	public TodayCartController(TodayCartService service) {
		
		this.service = service;
	} //Constructor
	
	//오늘의 장바구니 목록 보여주기
	@GetMapping("/cartList")
	public void cartList(@SessionAttribute("__AUTH__") UserVO userVO, Model model) throws ControllerException {
		log.trace("cartList({}, model) invoked.", userVO);
		
		try {
			CartUserDTO dto = new CartUserDTO();
			dto.setMember_id(userVO.getMember_id());
			dto.setLogin_id(userVO.getLogin_id());
			dto.setPwd(userVO.getPwd());
			dto.setAlias(userVO.getAlias());
			dto.setEmail(userVO.getEmail());
			dto.setMobile_num(userVO.getMobile_num());
			
			Integer member_id = Integer.parseInt(dto.getMember_id());
			
			List<TodayCartGoodsVO> goodsList = this.service.getGoods(member_id);
			
			model.addAttribute("__GOODSLIST__", goodsList);
			
			List<List<TodayCartPriceVO>> priceList = goodsList.stream()
															  .map(goods -> {
															      Integer goodsId = goods.getGoods_id(); // goodsList의 요소에서 goods_id 추출
															      try {
															          return this.service.getPrices(goodsId, member_id); // getPrices() 메소드 호출 결과를 리턴
															      } catch (ServiceException e) {
															          e.printStackTrace();
															          return null;
															      }
															  })
															  .collect(Collectors.toList());
			
			model.addAttribute("__PRICELIST__", priceList);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		
	} //get
	
	//오늘의 장바구니 -> 마이페이지 상세 장바구니
	@PostMapping("/register")
	public void register() {
		log.trace("register() invoked.");
	} //register
} //end class






