package org.zerock.wecart.service.pricecompare;

import java.util.Date;
import java.util.List;

import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
import org.zerock.wecart.exception.ServiceException;

public interface DetailMyPageCartService {

	//1. 상세 장바구니 상품 정보
	public List<TodayCartGoodsVO> getGoods(Integer cart_id) throws ServiceException;
	
	//2. 상세 장바구니 마트별 가격 정보
	public List<TodayCartPriceVO> getPrices(Integer goods_id, Date api_date, Integer member_id) throws ServiceException;
	
	//3. 장바구니 삭제
	public int removeCart(Integer cart_id) throws ServiceException;
	
	//4. 장바구니 생성날짜
	public String getCreationDate(Integer cart_id) throws ServiceException;
} //interface
