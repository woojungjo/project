package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;

public interface DetailMyPageCartMapper {

	//1. 상세장바구니 상품 정보 보여주기
	public List<TodayCartGoodsVO> selectGoods(Integer cart_id);
	
	//2. 상세장바구니 마트별 상품 가격
	public List<TodayCartPriceVO> selectPrices(Integer goods_id, Integer cart_id, Integer member_id);
	
	//3. 상품 선택 api 날짜 평균 가격 조회
	public int selectAvgPrice(Integer goods_id, Integer cart_id);
} //end interface
