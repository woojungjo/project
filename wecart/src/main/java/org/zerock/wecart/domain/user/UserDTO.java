package org.zerock.wecart.domain.user;

import lombok.Data;

@Data
public class UserDTO {
	private String login_id;
	private String pwd;
	private String alias;
	private String email;
	private String mobile_num;
	
}
