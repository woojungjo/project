package org.zerock.wecart.domain.saleboard;

import java.sql.Timestamp;

import lombok.Data;

@Data

public class SaleBoardDTO {
	private Integer post_no;
	private Integer member_id;
	private String title;
	private String content;
	private Integer views;
	private Timestamp write_dt;
	private Integer like_count;
	private Integer hate_count;
	private Integer report_cnt;
	private String writing_area;
}
