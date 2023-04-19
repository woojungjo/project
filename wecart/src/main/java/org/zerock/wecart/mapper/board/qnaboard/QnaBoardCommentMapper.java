package org.zerock.wecart.mapper.board.qnaboard;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.board.QnaBoardCommentDTO;
import org.zerock.wecart.domain.board.QnaBoardCommentVO;

public interface QnaBoardCommentMapper {
	
	// 게시글 댓글 조회
	@Select("SELECT * FROM qna_board_comment WHERE post_no = #{post_no} ORDER BY comment_no")
	public abstract List<QnaBoardCommentVO> selectAll(Integer post_no);
	
	// 게시글당 댓글 갯수 조회
	@Select("SELECT COUNT(*) FROM qna_board_comment WHERE post_no = #{post_no}")
	public abstract Integer countComment(Integer post_no);
	
	// 댓글등록
	public abstract boolean insertComment(QnaBoardCommentDTO dto);
	
	
	
	
} // end interface
