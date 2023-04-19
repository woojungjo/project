package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.MemberGoodsCartVO;

public interface MemberGoodsCartMapper {
	
	// member_id가 가지고 있는 installedCart List들을 return
	public abstract List<Integer> selecAllInstalledCartOfMember(Integer member_id);
	
	// member_id가 가지고 있는 installedCart List들을 return
	public abstract Integer selectTodayCartOfMember(Integer member_id);
	
	// member_id, goods_id, cart_id를 가지고 member_goods_cart의 row를 생성
	public abstract void insertRowIntoTodayCart(Integer member_id, Integer goods_id, Integer cart_id);
	
//	// 해당 장바구니에 상품을 추가
//	public abstract boolean insertGoodsToCart(Integer member_id, Integer goods_id, Integer cart_id);
	
	

	
	
} // MemberGoodsCartMapper
