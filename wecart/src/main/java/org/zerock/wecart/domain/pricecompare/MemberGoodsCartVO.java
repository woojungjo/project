package org.zerock.wecart.domain.pricecompare;

import lombok.Value;

@Value
public class MemberGoodsCartVO {
	
	public Integer member_goods_cart_id ; 
	public Integer member_id;
	public Integer goods_id;
	public Integer cart_id;
	
} // end class
