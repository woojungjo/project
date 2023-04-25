package org.zerock.wecart.domain.pricecompare;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2
public class TodayCartVO {

	private Integer goods_id;
	private String goods_name;
	private String goods_pic;
	private String retail_name;
	private Integer price;
	
} //end class
