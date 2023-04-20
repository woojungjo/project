package org.zerock.wecart.service.pricecompare;

import java.sql.Timestamp;
import java.util.List;

import org.zerock.wecart.domain.pricecompare.CartVO;
import org.zerock.wecart.exception.ServiceException;

public interface CartService {
	
	public abstract void createTodayCart(
			Timestamp cart_creation_date,
			Timestamp API_date,
			String status) throws ServiceException;
	/*
	// 회원이 가지고 있는 오늘의 장바구니를 반환
	public abstract CartVO searchTodayCart(Integer member_id, Integer cart_id) throws ServiceException;
	
	// 회원이 가지고 있는 오늘의 장바구니를 저장
	public abstract Integer saveTodayCart(Integer member_id) throws ServiceException;
	
	// 회원이 가지고 있는 저장된 장바구니를 반환 (회원 id, 카트 id, 장바구니 상태) 
	public abstract List<CartVO> searchInstalledCart(Integer member_id, String status) throws ServiceException;
	*/
} // CartService
