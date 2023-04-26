package org.zerock.wecart.domain.pricecompare;

import java.util.Date;

import lombok.Value;

@Value
public class TodayCartPriceVO {
	
	private Integer cart_id;
	private Integer goods_id;
	private String retail_name;
	private Integer town_id;
	private Integer price;
	private Date API_date;
} //end class
