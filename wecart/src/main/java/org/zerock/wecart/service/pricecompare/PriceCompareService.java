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
} //end interface
