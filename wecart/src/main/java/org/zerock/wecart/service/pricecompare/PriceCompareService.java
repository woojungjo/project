package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.exception.ServiceException;

public interface PriceCompareService {

	//1. 상품 전체 목록 조회
	public abstract List<GoodsVO> getList() throws ServiceException;
} //end interface
