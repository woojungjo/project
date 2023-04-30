package org.zerock.wecart.domain;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class UserVO {
	private String member_id;
	private Integer town_id;
	private String login_id;
	private String alias;
	private Integer money;
	private String email;
	private Integer mobile_num;
	private String sns;
	private String pwd;
	private Timestamp join_date;
	private Integer point;
	private String authority_code;
	private String admin_account;
} // end class
