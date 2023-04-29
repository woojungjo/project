package org.zerock.wecart.domain.pricecompare;

import lombok.Value;

@Value
public class TodayCartGoodsVO {

	private Integer goods_id;
	private String goods_name;
	private String goods_pic;
	private Integer amount;

} //end class
