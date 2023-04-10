package org.zerock.wecart.domain.board;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class QnaBoardVO {
	private Integer post_no;
	private Integer member_id;
	private String title;
	private String content;
	private Integer views;
	private Timestamp write_dt;
	private Integer secret_yn;
	private Integer comment_count;
//	private String post_no;
//	private String member_id;
//	private String title;
//	private String content;
//	private String views;
//	private String write_dt;
//	private String secret_yn;
	
}
