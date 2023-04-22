package org.zerock.wecart.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.pricecompare.CartDTO;
import org.zerock.wecart.domain.pricecompare.CartVO;
import org.zerock.wecart.domain.pricecompare.GooodsVO;
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
	
	// 장바구니 리스트들을 일주일, 한달, 3개월 6개월 순으로 보여주기 (미완)
	@PostMapping("/arrangeByMonth")
	public void arrangeByMonth() {
		log.trace("arrangeByMonth() invoked. ");
	}// arrangeByMonth  jhwan
	 
	// 장바구니 리스트 보여주기 (완)
	@GetMapping("/list")
	public ModelAndView list(@SessionAttribute("__AUTH__") UserVO userVO) throws ServiceException{
		log.trace("list(userVO: {}) invoked. ", userVO);
		
		try {
			Integer member_id = Integer.parseInt(userVO.getMember_id());
			List<CartVO> cartVOs = this.service.selectCartVOsOfMemberFromCart(member_id, "Installed");
			List<CartDTO> cartDTOs = new ArrayList<>();
			
			for(CartVO cartvo : cartVOs){
				// Timestamp를 변환시켜서 DTO에 넘겨준다
				Timestamp timestamp = cartvo.getCart_creation_date();
				long time = timestamp.getTime();
				Date date = new Date(time);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String formattedDate = sdf.format(date);
				
				// get number of Goods
				Integer numberOfGoods = this.service.selectNumberOfGoods(member_id, cartvo.getCart_id());
				
				// get pic of Goods in cart
				String picOfGoods = this.service.selectPicOfGoods(member_id, cartvo.getCart_id());
				
				CartDTO cartDTO = new CartDTO();
				cartDTO.setCart_id(cartvo.getCart_id());
				cartDTO.setCart_creation_date(formattedDate);
				cartDTO.setNumberOfGoods(numberOfGoods);
				cartDTO.setPicOfGoods(picOfGoods);
				
				cartDTOs.add(cartDTO);
			};
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("__CARTDTOS__", cartDTOs);
			mav.setViewName("mypage/cart/list");
			
		return mav;
		}catch(Exception e) {
			throw new ServiceException(e);
		} // try - catch
	} // list  jhwan
	
	// 찜한 상품들 표시 (controller 완) => UI에 데이터가 잘 뿌려졌는지 확인 
	@GetMapping("/wishedPrds")
	public void wishedPrds(@SessionAttribute("__AUTH__") UserVO userVO, Model model) throws ServiceException{
		log.trace("wishedPrds() invoked.");
		log.trace("\t+ userVO: {}", userVO);
		Integer member_id = Integer.parseInt(userVO.getMember_id());
		
		try {
			List<GooodsVO> goodsObject = this.service.selectGooodsVoOfMemberFromWishList(member_id);
			model.addAttribute("__GOODS_OBJECT_LIST__", goodsObject);
		}catch(Exception e) {
			throw new ServiceException(e);
		} // try - catch
	} // wishedPrds  jhwan
	
//		Integer cartId = this.service.getTodayCartIdOfMember(member_id);
	/*
	 * => PriceCompareController의 /removeWishedGoods로 변경 
	// 찜한 상품 삭제
	@GetMapping("/wishedPrdsRemoved")
	public String wishedPrdsRemoved() {
		log.trace("wishedPrdsRemoved() invoked. ");
		
		return "redirect:wishedPrds";
	} // wishedProdsRemoved   jhwan
	*/
	
	// 상품을 오늘의 장바구니에 보관 (완)
	@PostMapping("/saveGoodsIntoTodayCart")
	@ResponseBody
	public String saveGoodsIntoTodayCart(Model model, @RequestBody HashMap<String, Integer> map) throws ServiceException{
		log.trace("register({}) invoked.", model);
		log.trace("HashMap<String, Object> map: {}", map);
		
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
			
			// (1) 만약 오늘의 장바구니에 goods_id가 이미 있다면 1 return
			if(this.service.checkGoodsIdInTodayCart(todayCartId, goods_id) != null)
				return "false";
			
			// (2) member_id, goods_id, TodayCart_id로 member_goods_cart 테이블을 생성
			this.service.saveGoodsIntoTodayCart(member_id, goods_id, todayCartId);
			// return true;
		} 
		// 만약 가지고 있는 TodayCart가 없다면.
		else {
			// (1)  판매 테이블에서 최신 api 날짜를 가져오고 TodayCart 생성하고 TodayCart_id를 받기
			todayCartId = this.service.createAndReturnTodayCartId();
			// (2) member_id, goods_id, TodayCart_id로 member_goods_cart 테이블을 생성
			this.service.saveGoodsIntoTodayCart(member_id, goods_id, todayCartId);
			
			// return true;
		} // if - else
		
		return "Successfully save goods into todayCart";
	} //saveGoodsIntoTodayCart
	
	// 해당 상품을 상품 찜목록에 저장 (완)
//	@PostMapping("/addPrd")
	@PostMapping("/saveGoodsIntoWishedGoods")
	@ResponseBody
	public String saveGoodsIntoWishedGoods(Model model, @RequestBody HashMap<String, Integer> goods) throws ServiceException{
		log.trace("saveGoodsIntoWishedGoods() invoked. ");
		
		try {
			Integer goods_id = goods.get("goods_id");
			UserVO userVO = (UserVO)model.getAttribute("__AUTH__");
			Integer member_id = Integer.parseInt(userVO.getMember_id());
			
			// wish_list row에 추가
			this.service.saveGoodsIntoWishList(member_id, goods_id);
			
			return "Successfully save goods into wishList"; 
		}catch(Exception e) {
			throw new ServiceException(e);
		} // try - catch
	} // addPrd Jhwan
	
	// 찜한 상품 목록에서 상품 삭제 (완)
	@PostMapping("/removeWishedGoods")
	@ResponseBody
	public String removeWishedGoods(Model model, @RequestBody HashMap<String, Integer> goods) throws ServiceException{
		log.trace("removeWishedGoods() invoked. ");
		
		try {
			Integer goods_id = goods.get("goods_id");
			UserVO userVO = (UserVO)model.getAttribute("__AUTH__");
			Integer member_id = Integer.parseInt(userVO.getMember_id());
			
			// wish_list row에 삭제
			this.service.deleteGoodsFromWishList(member_id, goods_id);
			
			return "Successfully remove goods into wishList";
		}catch(Exception e) {
			throw new ServiceException(e);
		} // try - catch
	} // wishedProdsRemoved   jhwan
} //end class
