package org.zerock.wecart.domain.pricecompare;

import lombok.Data;

@Data
public class CartUserDTO {
	
	private String member_id;
	private String login_id;
	private String pwd;
	private String alias;
	private String email;
	private String mobile_num;
} //end class
