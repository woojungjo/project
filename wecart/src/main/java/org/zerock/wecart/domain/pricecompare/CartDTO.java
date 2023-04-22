package org.zerock.wecart.domain.pricecompare;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartDTO {
	Integer cart_id;
	String cart_creation_date;
	Integer numberOfGoods;
	String picOfGoods;
}
