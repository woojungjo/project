package org.zerock.wecart.domain.pricecompare;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class SaleVO {
	public Timestamp api_date;
	public Integer retail_id;
	public Integer goods_id;
	public Integer price;
}
