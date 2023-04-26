package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;

public interface TodayCartMapper {

	//1. 오늘의 장바구니 상품 정보 조회
	public List<TodayCartGoodsVO> selectGoods(Integer member_id);
	
	//2. 오늘의 장바구니 마트별 가격 조회
	public List<TodayCartPriceVO> selectPrices(Integer cart_id);
} //end interface
