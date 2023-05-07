package org.zerock.wecart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsPageDTO;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.domain.pricecompare.GooodsVO;
import org.zerock.wecart.domain.pricecompare.PriceDTO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.pricecompare.PriceCompareService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@SessionAttributes({"__AUTH__"})
@RequestMapping("/priceCompare")
@Controller
public class PriceCompareController {
	
	private PriceCompareService service;

	@Autowired
	public PriceCompareController(PriceCompareService service) {
		this.service = service;
	} //Constructor
	
	@GetMapping("/listPage")
	public void listPage() {
		log.trace("listPage() invoked.");
	} //listPage
	
	//전체 상품 조회(페이징 처리)
	@GetMapping("/list")
	public String list(GoodsCriteria cri, Model model) throws ControllerException {
		log.trace("list({}, model) invoked.", cri);
		

		try {
			List<GoodsVO> list = this.service.getList(cri);
			model.addAttribute("__GOODSLIST__", list);

			
			int totalAmount = this.service.getTotalAmount(cri.getKeyword(), cri.getCategory());
			GoodsPageDTO pageDTO = new GoodsPageDTO(cri, totalAmount);
			log.info("\t+ pageDTO: {}", pageDTO);
			
			model.addAttribute("__GOODSPAGEMAKER__", pageDTO);	
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		return "forward:listPage";
	} //list
	
	//상품 검색 시 화면
	@GetMapping("/search")
	public String search(GoodsCriteria cri, Model model) throws ControllerException {
		log.trace("search({}, model) invoked.", cri);
		
		try {
			List<GoodsVO> list = this.service.getSearchList(cri);
			model.addAttribute("__GOODSLIST__", list);
			
			int totalAmount = this.service.getTotalAmount(cri.getKeyword(), cri.getCategory());
			GoodsPageDTO pageDTO = new GoodsPageDTO(cri, totalAmount);
			log.info("\t+ pageDTO: {}", pageDTO);
			
			model.addAttribute("__GOODSPAGEMAKER__", pageDTO);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		return "forward:listPage";
	} //search


	// 한 상품을 디테일하게 보여줌 (완)
	@GetMapping("/showPrd/{goods_id}")
	public String showPrd(
		@PathVariable("goods_id") Integer goods_id,
		Model model,
		@SessionAttribute(name = "__AUTH__", required = false) UserVO userVO
		) 
	throws ControllerException {
		log.trace("showPrd() invoked. ");
		
		if(userVO == null) {
			return "priceCompare/showPrd";
		}
		//

		boolean checkUpdate = true;
		try {
			GooodsVO goods = this.service.selectGooodsVO(goods_id);
			log.trace("goods: {}", goods);
			
			checkUpdate = this.service.updateReadcntOfGoods(goods_id);
			log.trace("상품 조회수가 +1 되었는지 여부: {}", checkUpdate);
			
			List<PriceDTO> priceDTO = this.service.getPriceDTOList(Integer.parseInt(userVO.getMember_id()), goods_id);
			log.trace("error check2 ");
			model.addAttribute("__PRICEDTO__", priceDTO);
			
			// 회원의 id와 
			model.addAttribute("__GOODS__", goods);
			
			return "priceCompare/showPrd";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try - catch
	} // showPrd/{goods_id}

	/*
	 * MypageCartController의 /saveGoodsIntoTodayCart 로 이동
	// 카트를 누르면 상품을 오늘의 카트에 담는다.
	// Deprecated
	@PostMapping("/addPrdToCart")
	public void addPrdToCart() {
		log.trace("addPrdToCart() invoked. ");
	} // addPrdToCart Jhwan
	*/
} // end class
