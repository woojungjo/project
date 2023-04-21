package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.GooodsVO;
import org.zerock.wecart.exception.ServiceException;

public interface MypageCartService {
	// 멤버 아이디로 저장된 장바구니_id들을 반환
	public abstract List<Integer> getInstalledCartIdsOfMember(Integer member_id) throws ServiceException;
	
	// 멤버 아이디로 TodayCart_id들을 반환
	public abstract Integer getTodayCartIdOfMember(Integer member_id) throws ServiceException;
	
	// cart_id와 goods_id로 member_goods_cart 테이블을 확인하여, 없다면 true 있다면 false
	public abstract Integer checkGoodsIdInTodayCart(Integer cart_id, Integer goods_id) throws ServiceException;
	
	// member_id, goods_id, cart_id를 받아 물건을 member_goods_cart 테이블에 저장
	public abstract void saveGoodsIntoTodayCart(Integer member_id, Integer goods_id, Integer cart_id) throws ServiceException;
	
	// wishlist에 a row 생성
	public abstract void saveGoodsIntoWishList(Integer member_id, Integer goods_id) throws ServiceException;
	
	//wishlist에서 a row 삭제
	public abstract void deleteGoodsFromWishList(Integer member_id, Integer goods_id) throws ServiceException;

	//오늘의 장바구니를 생성하고 해당 장바구니의 Id를 반환
	public abstract Integer createAndReturnTodayCartId() throws ServiceException;
	
	// GooodsVO를 반환
	public abstract GooodsVO selectGooodsVO(Integer goods_id) throws ServiceException;
	
	// 멤버의 Id를 받아서 List<GooodsVO>를 반환한다.
	public abstract List<GooodsVO> selectGooodsVoOfMember(Integer goods_id) throws ServiceException;
}
