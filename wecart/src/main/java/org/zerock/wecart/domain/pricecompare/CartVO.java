package org.zerock.wecart.domain.pricecompare;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class CartVO {
	Integer cart_id;
	Timestamp cart_creation_date;
	Timestamp API_date;
	String status;
}
