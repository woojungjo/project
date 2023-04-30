package org.zerock.wecart.domain.user;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SignUpDTO {
	private String login_id;
	private String alias;
	private Integer money;
	private String email;
	private String mobile_num;
	private String sns;
	private String pwd;
	private Timestamp join_date;
	private Integer point;
	private String authority_code;
	private String admin_account;

}
