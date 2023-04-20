package org.zerock.wecart.mapper.pricecompare;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.zerock.wecart.domain.pricecompare.CartVO;

public interface CartMapper {

	
	// 장바구니를 생성
	//CartMapper.xml 과 중복되어 있습니다. 그래서 오류가 나 임시 주석 처리했습니다. 취사선택 해아할 것 같습니다.
//	@Insert("""
//			INSERT INTO cart(cart_creation_date, API_date, status)
//			VALUES (#{cart_creation_date}, #{API_date}, #{status})
//			""")
	public abstract void insertCart(
			Timestamp cart_creation_date,
			Timestamp API_date,
			String status
			);
	
	
	// 장바구니를 선택
	public abstract CartVO selectCart(Integer cart_id);
	
	// 오늘의 장바구니를 일반 장바구니로 변환
	public abstract Integer updateCart(Integer cart_id);
	
	// 장바구니를 삭제
	public abstract void deleteCart(Integer cart_id);
	
	// 회원이 가지고 있는 저장된 장바구니를 반환
	public abstract List<CartVO> selectInstalledCart(Integer member_id, String status);
}
