package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsVO;

public interface PriceCompareMapper {

	//1. 상품 전체 조회
	public abstract List<GoodsVO> selectAll(GoodsCriteria cri);
	
	//2. 총 상품 개수 반환
	@Select("SELECT count(goods_id) FROM goods WHERE goods_id <= 800")
	public abstract Integer selectTotalCount();
} //end interface
