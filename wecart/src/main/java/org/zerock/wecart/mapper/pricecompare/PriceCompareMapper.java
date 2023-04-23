package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsVO;

public interface PriceCompareMapper {

	//1. 상품 전체 조회
	public abstract List<GoodsVO> selectAll(GoodsCriteria cri);
	
	//2. 총 상품 개수 반환
	public abstract Integer selectTotalCount(String keyword, Integer category);
	
	//3. 상품 검색
	public abstract List<GoodsVO> selectSearch(GoodsCriteria cri);
  
    //4. 한 가지 상품을 조회
	public abstract GoodsVO select(Integer goods_id);
	
	
	

	


} //end interface
