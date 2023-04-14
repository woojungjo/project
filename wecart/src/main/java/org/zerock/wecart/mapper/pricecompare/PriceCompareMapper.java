package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.GoodsVO;

public interface PriceCompareMapper {

	//1. 상품 전체 조회
	public abstract List<GoodsVO> selectAll();
	
	// 한 가지 상품을 조회
	public abstract GoodsVO select(Integer goods_id);
} //end interface
