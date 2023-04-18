package org.zerock.wecart.service.pricecompare;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.wecart.domain.pricecompare.CartVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.CartMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class CartServiceImpl implements CartService{
	
	@Setter(onMethod_=@Autowired)
	private CartMapper mapper;
	
	public void createTodayCart(
			Timestamp cart_creation_date,
			Timestamp API_date,
			String status) throws ServiceException{
		log.trace("createTodayCart({}, {}, {}) invoked. ", cart_creation_date, API_date, status);
		
		try {
			this.mapper.insertCart( cart_creation_date, API_date, status);
		}catch(Exception e) {
			throw new ServiceException(e);
		}// try-catch
		
	};
	
		
	// 회원이 가지고 있는 오늘의 장바구니를 반환
	public CartVO searchTodayCart(Integer member_id, Integer cart_id) throws ServiceException{
		
		return null;
	} // searchTodayCart
	
	// 회원이 가지고 있는 오늘의 장바구니를 저장
	public Integer saveTodayCart(Integer member_id) throws ServiceException{
		
		return null;
	} // saveTodayCart
	
	// 회원이 가지고 있는 저장된 장바구니를 반환
	public List<CartVO> searchInstalledCart(Integer member_id, String status) throws ServiceException{
		log.trace("searchInstalledCart({}, {}, {})", member_id, status);
		
		
		return null;
	} //searchInstalledCart
	
	
} // CartService
