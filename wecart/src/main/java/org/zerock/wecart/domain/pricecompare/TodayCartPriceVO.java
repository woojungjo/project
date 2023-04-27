package org.zerock.wecart.domain.pricecompare;

import java.util.Date;

import lombok.Data;

@Data
public class TodayCartPriceVO {
	
	private Integer goods_id;
	private Integer retail_id;
	private String retail_name;
	private Integer price;
	private Integer avg_price;
	private Date api_date;
} //end class
