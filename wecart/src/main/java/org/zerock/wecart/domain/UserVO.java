package org.zerock.wecart.domain;

import lombok.Value;

@Value
public class UserVO {
	private String member_id;
	private String login_id;
	private String pwd;
	private String alias;
	private String email;
	private String mobile_num;

} // end class
