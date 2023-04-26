package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface MemberGoodsCartMapper {
	
	// 오늘의 장바구니에 저장할 때, 이미 있는 아이템인지 확인하기
	@Select(""" 
			SELECT DISTINCT cart_id
			FROM member_goods_cart
			WHERE 
				cart_id = #{cart_id}
			AND
				goods_id = #{goods_id}
			""")
	public abstract Integer selectCartIdForCheckingGoods(Integer cart_id, Integer goods_id);
	
	// member_id가 가지고 있는 installedCart List들을 return
	public abstract List<Integer> selecAllInstalledCartOfMember(Integer member_id);
	
	// member_id가 가지고 있는 TodayCart List들을 return
	public abstract Integer selectTodayCartOfMember(Integer member_id);
	
	// member_id, goods_id, cart_id를 가지고 member_goods_cart의 row를 생성
	public abstract void insertRowIntoTodayCart(Integer member_id, Integer goods_id, Integer cart_id);
	
	// member_id와 cart_id를 가지고 아이템 수를 return
	public abstract Integer selectNumberOfGoods(Integer member_id, Integer cart_id);
	
	// 임의의 사진 한장을 return
	public abstract String selectPicOfGoods(Integer member_id, Integer cart_id);
	
//	// 해당 장바구니에 상품을 추가
//	public abstract boolean insertGoodsToCart(Integer member_id, Integer goods_id, Integer cart_id);
	
	

	
	
} // MemberGoodsCartMapper
