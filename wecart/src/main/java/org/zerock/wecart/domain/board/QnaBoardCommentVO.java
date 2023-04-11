package org.zerock.wecart.domain.board;

import java.sql.Timestamp;
import lombok.Value;

@Value

public class QnaBoardCommentVO {
	private Integer comment_no;
	private Integer post_no;
	private Integer member_id;
	private Integer secret_yn;
	private String content;
	private Integer like_cnt;
	private Integer high_comment_no;
	private Timestamp write_dt;
	private Integer comment_lv;
}
