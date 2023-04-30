package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.exception.ServiceException;

public interface DetailMyPageCartService {

	//1. 상세 장바구니 상품 정보
	public List<TodayCartGoodsVO> getGoods(Integer cart_id) throws ServiceException;
} //interface
