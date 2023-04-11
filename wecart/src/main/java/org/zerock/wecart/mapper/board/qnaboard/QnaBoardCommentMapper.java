package org.zerock.wecart.mapper.board.qnaboard;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardCommentVO;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;

public interface QnaBoardCommentMapper {
	
	// 게시글 댓글 조회
	@Select("SELECT * FROM qna_board_comment WHERE post_no = #{post_no}")
	public abstract List<QnaBoardCommentVO> selectAll(Integer post_no);
	
	@Select("SELECT COUNT(*) FROM qna_board_comment WHERE post_no = #{post_no}")
	public abstract Integer selectTotalCount();
	
	
} // end interface
