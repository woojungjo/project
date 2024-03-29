package org.zerock.wecart.domain.board;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaBoardDTO {
	private Integer post_no;
	private Integer member_id;
	private String title;
	private String content;
	private Integer views;
	private Timestamp write_dt;
	private Integer secret_yn;
}
