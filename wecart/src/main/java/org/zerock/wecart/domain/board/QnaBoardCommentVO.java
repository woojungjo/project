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
	private Integer delete_yn;
	private Timestamp write_dt;
	private Integer comment_root;
	private Integer comment_step;
	private Integer comment_indent;
	private Integer like_count;
}
