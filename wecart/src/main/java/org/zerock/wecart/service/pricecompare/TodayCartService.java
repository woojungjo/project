package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
import org.zerock.wecart.exception.ServiceException;

public interface TodayCartService {
	
	//1. 오늘의 장바구니 상품 정보 조회
	public List<TodayCartGoodsVO> getGoods(Integer member_id) throws ServiceException;
	
	//2. 오늘의 장바구니 마트별 상품 가격 조회
	public List<TodayCartPriceVO> getPrices(Integer goods_id, Integer member_id) throws ServiceException;
	
	//3. 상품 삭제
	public int remove(Integer goods_id, Integer member_id) throws ServiceException;
} //end class
