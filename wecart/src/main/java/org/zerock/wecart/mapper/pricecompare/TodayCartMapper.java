package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;

public interface TodayCartMapper {

	//1. 오늘의 장바구니 상품 정보 조회
	public List<TodayCartGoodsVO> selectGoods(Integer member_id);
	
	//2. 오늘의 장바구니 마트별 가격 조회
	public List<TodayCartPriceVO> selectPrices(Integer goods_id, Integer member_id);
	
	//3. 상품 최신 api 날짜 평균 가격 조회
	public int selectAvgPrice(Integer goods_id);
	
	//4. 오늘의 장바구니 삭제
	public int delete(Integer goods_id, Integer member_id);
} //end interface
