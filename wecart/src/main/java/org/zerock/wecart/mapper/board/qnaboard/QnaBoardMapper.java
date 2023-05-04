package org.zerock.wecart.mapper.board.qnaboard;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardDTO;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;

public interface QnaBoardMapper {
	// 전체 목록조회
	public abstract List<QnaBoard_CommentCountVO> selectAll(Criteria cri);
	
	// 게시글 하나 상세조회
	@Select("SELECT * FROM qna_board WHERE post_no = #{post_no}")
	public abstract QnaBoardVO read(Integer post_no);
	
	// 전체 게시글수 조회(페이징처리용)
	@Select("SELECT COUNT(*) FROM qna_board WHERE post_no > 0")
	public abstract Integer selectTotalCount();
	
	// 조회수 업데이트
	@Update("UPDATE qna_board SET views = views + 1 WHERE post_no = #{post_no}")
	public abstract void updateViews(Integer post_no);
	
	//신규 게시물 등록 //added yeonjoo
	public abstract Integer insert(QnaBoardDTO dto);
	
	// 게시글 삭제
	@Delete("DELETE FROM qna_board WHERE post_no = #{post_no}")
	public abstract void delete(Integer post_no);
} // end interface
