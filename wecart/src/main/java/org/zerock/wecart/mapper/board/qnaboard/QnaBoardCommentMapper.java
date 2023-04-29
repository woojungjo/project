package org.zerock.wecart.mapper.board.qnaboard;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zerock.wecart.domain.board.QnaBoardCommentDTO;
import org.zerock.wecart.domain.board.QnaBoardCommentVO;

public interface QnaBoardCommentMapper {
	
	// 게시글 댓글 조회
//	@Select("SELECT * FROM qna_board_comment WHERE post_no = #{post_no} ORDER BY comment_root ASC, comment_step ASC, comment_indent ASC")
	public abstract List<QnaBoardCommentVO> selectAll(Integer post_no);
	
	// 게시글당 댓글 갯수 조회
	@Select("SELECT COUNT(*) FROM qna_board_comment WHERE post_no = #{post_no}")
	public abstract Integer countComment(Integer post_no);
	
	// 댓글등록
	public abstract boolean insertComment(QnaBoardCommentDTO dto);
	
	// 댓글 업데이트
	@Update("UPDATE qna_board_comment SET content = #{content}, secret_yn = #{secret_yn} WHERE comment_no = #{comment_no}")
	public abstract boolean updateComment(QnaBoardCommentDTO dto);
	
	// 댓글의 step과 indent 업데이트
	@Update(" UPDATE qna_board_comment SET comment_step = comment_step + 1 WHERE comment_root = #{comment_root} AND comment_step >= #{comment_step} ")
	public abstract boolean updateCommentStepIndent(QnaBoardCommentDTO dto);
	
	// 댓글 삭제된것처럼 처리
	@Update("UPDATE qna_board_comment SET delete_yn = 1 WHERE comment_no = #{comment_no}")
	public abstract boolean deleteComment(Integer comment_no);
	
	// 댓글 이미 좋아요 했는지 확인
	@Select("SELECT count(*) FROM qna_board_comment_like WHERE comment_no = #{comment_no} AND member_id = #{member_id}")
	public abstract Integer commentAlreadyLIke(QnaBoardCommentDTO dto);
	
	// 좋아요 업
	@Insert("INSERT INTO qna_board_comment_like(post_no, comment_no, member_id) VALUES(#{post_no}, #{comment_no}, #{member_id})")
	public abstract void commentLIkeUP(QnaBoardCommentDTO dto);
	
	// 좋아요 다운
	@Delete("DELETE FROM qna_board_comment_like WHERE comment_no = #{comment_no}")
	public abstract void commentLIkeDOWN(QnaBoardCommentDTO dto);
	
	
	
	
} // end interface
