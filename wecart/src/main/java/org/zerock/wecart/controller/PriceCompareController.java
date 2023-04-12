package org.zerock.wecart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsPageDTO;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.pricecompare.PriceCompareService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/priceCompare")
@Controller
public class PriceCompareController {

	private PriceCompareService service;
	
	@Autowired
	public PriceCompareController(PriceCompareService service) {
		this.service = service;
	} //Constructor
	
	
	//전체 상품 조회(페이징 처리)
	@GetMapping("/list")
	public void list(GoodsCriteria cri, Model model) throws ControllerException {
		log.trace("list() invoked.");
		
		try {
			List<GoodsVO> list = this.service.getList(cri);
			model.addAttribute("__GOODSLIST__", list);
			
			int totalAmount = this.service.getTotalAmount();
			GoodsPageDTO pageDTO = new GoodsPageDTO(cri, totalAmount);
			log.info("\t+ pageDTO: {}", pageDTO);
			
			model.addAttribute("__GOODSPAGEMAKER__", pageDTO);	
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
	} //list
	
	//상품 검색 시 화면
	@GetMapping("/search")
	public void search(String search_item) {
		log.trace("search() invoked.");
		log.info("\t+ search_item: {}", search_item);
	} //search

	
	// 한 상품을 디테일하게 보여줌
	// showPrd/{mainCategory} 식으로 보여줘야 할 것 같음 => RestFUL API 공부 후 파악하기
	@GetMapping("/showPrd")
	public void priceCompare() {
		log.trace("showPrd() invoked. ");
		
	} // priceCompare   Jhwan
	
	// 카트를 누르면 상품을 오늘의 카트에 담는다.
	@PostMapping("/addPrdToCart")
	public void addPrdToCart() {
		log.trace("addPrdToCart() invoked. ");
		
		
	} // addPrdToCart   Jhwan
	
	// 해당 상품을 찜할 수 있음
	@PostMapping("/addPrd")
	public String addPrd() {
		log.trace("addPrd() invoked. ");
		
		return "redirect:showPrd";
	} // addPrd   Jhwan
	
} //end class
