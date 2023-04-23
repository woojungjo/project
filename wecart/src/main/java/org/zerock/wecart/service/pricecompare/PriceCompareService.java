package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.exception.ServiceException;

public interface PriceCompareService {



	//1. 상품 전체 목록 조회
	public abstract List<GoodsVO> getList(GoodsCriteria cri) throws ServiceException;
	
	//2. 총 상품 개수 반환
	public abstract Integer getTotalAmount(String keyword) throws ServiceException;
	
	//3. 상품 검색 목록
	public abstract List<GoodsVO> getSearchList(GoodsCriteria cri) throws ServiceException;
  
  //4. id에 해당하는 상품 조회
	public abstract GoodsVO select(Integer goods_id) throws ServiceException;

	// goods_id를 받고 해당 조회수를 ++한다. 만약 update가 안됐으면 false를 return한다.
	public abstract boolean updateReadcntOfGoods(Integer goods_id) throws ServiceException;

} //end interface
