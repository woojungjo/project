package org.zerock.wecart.domain.pricecompare;

import lombok.Value;

@Value
public class GooodsVO {
	public Integer goods_id;
	public String goods_name;
	public String goods_pic;
	public String goods_manufacturer;
	public String capacity;
	public String category_id;
	public Integer readcnt;
}
