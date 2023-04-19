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
	
	// 멤버 아이디로 저장된 장바구니_id들을 반환
	public abstract List<Integer> getInstalledCartIdsOfMember(Integer member_id) throws ServiceException;
	
	// 멤버 아이디로 TodayCart_id들을 반환
	public abstract Integer getTodayCartIdOfMember(Integer member_id) throws ServiceException;
	
	// member_id, goods_id, cart_id를 받아 물건을 저장
	public abstract void saveGoodsIntoTodayCart(Integer member_id, Integer goods_id, Integer cart_id) throws ServiceException;

} //end interface
