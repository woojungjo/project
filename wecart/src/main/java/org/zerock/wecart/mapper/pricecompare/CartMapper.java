package org.zerock.wecart.mapper.pricecompare;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.pricecompare.CartVO;

public interface CartMapper {

	
	// 장바구니를 생성

	@Insert("""
			INSERT INTO cart (cart_creation_date, API_date, status)
			VALUES (#{cart_creation_date}, #{API_date}, #{status})
			""")
	public abstract void insertAndSelectCartId(
			Timestamp cart_creation_date,
			Timestamp API_date,
			String status
			);
	
	// 가장 최근 생성된 장바구니 가져오기
	@Select("""
			SELECT cart_id
			FROM cart c
			JOIN
			(
				SELECT max(cart_creation_date) AS latest_date
				FROM cart
			) a ON c.cart_creation_date = a.latest_date
			""")
	public abstract Integer selectCartIdOfCartCreationDate();
	
	
	// 장바구니를 선택
	public abstract CartVO selectCart(Integer cart_id);
	
	// 오늘의 장바구니를 일반 장바구니로 변환
	public abstract Integer updateCart(Integer cart_id);
	
	// 장바구니를 삭제
	public abstract void deleteCart(Integer cart_id);
	
	// 회원이 가지고 있는 저장된 장바구니를 반환
	public abstract List<CartVO> selectInstalledCart(Integer member_id, String status);
}
