package org.zerock.wecart.domain.pricecompare;

import lombok.Data;

@Data
public class PriceDTO {
	private String retail_name;
	private String goods_name;
	private Integer price;
	private Integer avg_price;
}
