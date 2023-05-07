package org.zerock.wecart.mapper.board.saleboard;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.saleboard.SaleBoardDTO;
import org.zerock.wecart.domain.saleboard.SaleBoardListVO;

public interface SaleBoardMapper {
	// 전체 목록조회
	public abstract List<SaleBoardListVO> selectAll(Criteria cri);
	
//	// 게시글 하나 상세조회
//	@Select("SELECT * FROM qna_board WHERE post_no = #{post_no}")
	public abstract SaleBoardListVO read(Integer post_no);
//	
	// 전체 게시글수 조회(페이징처리용)
	@Select("SELECT COUNT(*) FROM sale_board WHERE post_no > 0")
	public abstract Integer selectTotalCount();
//	
	// 조회수 업데이트
	@Update("UPDATE sale_board SET views = views + 1 WHERE post_no = #{post_no}")
	public abstract void updateViews(Integer post_no);
//	
//	//신규 게시물 등록 //added yeonjoo
//	public abstract Integer insert(QnaBoardDTO dto);
	
	// 좋아요 했는지 확인
	@Select("SELECT count(*) FROM sale_board_like WHERE post_no = #{post_no} AND member_id = #{member_id}")
	public abstract Integer alreadyLIke(SaleBoardDTO dto);
	
	// 좋아요 업
	@Insert("INSERT INTO sale_board_like(post_no, member_id) VALUES(#{post_no}, #{member_id})")
	public abstract void lIkeUP(SaleBoardDTO dto);
	
	// 좋아요 다운
	@Delete("DELETE FROM sale_board_like WHERE post_no = #{post_no}  AND member_id = #{member_id}")
	public abstract void lIkeDOWN(SaleBoardDTO dto);
	
	
	// 싫어요 했는지 확인
	@Select("SELECT count(*) FROM sale_board_hate WHERE post_no = #{post_no} AND member_id = #{member_id}")
	public abstract Integer alreadyHate(SaleBoardDTO dto);
	
	// 싫어요 업
	@Insert("INSERT INTO sale_board_hate(post_no, member_id) VALUES(#{post_no}, #{member_id})")
	public abstract void hateUP(SaleBoardDTO dto);
	
	// 싫어요 다운
	@Delete("DELETE FROM sale_board_hate WHERE post_no = #{post_no}  AND member_id = #{member_id}")
	public abstract void hateDOWN(SaleBoardDTO dto);

	@Delete("DELETE FROM sale_board WHERE post_no = #{post_no}")
	public abstract void delete(Integer post_no);

	
} // end interface
