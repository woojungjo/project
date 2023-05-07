package org.zerock.wecart.mapper.board.mateboard;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.mateboard.MateBoardDTO;
import org.zerock.wecart.domain.mateboard.MateBoardVO;

public interface MateBoardMapper {
		
	// 전체 목록 조회
	public abstract List<MateBoardVO> selectAll(Criteria cri);
	
	//6. 총 게시물건수 반환
	//항상똑같이 구하고, 길지 않기 때문에 @어노테이션방식
	@Select("SELECT count(post_no) FROM mate_board WHERE post_no > 0") 
	public abstract Integer selectTotalCount();		
	
	//2. 게시물 상세 조회
	public abstract MateBoardVO select(Integer post_no);
	
	//3. 기존 게시물 수정 
	public abstract Integer update(MateBoardDTO dto);
	
	//4. 신규 게시물 등록
	public abstract Integer insert(MateBoardDTO dto);
	
	//5. 기존 게시물 삭제 
	public abstract Integer delete(Integer post_no);
	
	// 조회수 업데이트
	@Update("UPDATE mate_board SET views = views + 1 WHERE post_no = #{post_no}")
	public abstract void updateViews(Integer post_no);
	
	//신고 
	public abstract int increaseReportCnt(Integer post_no);
}//MateBoardMapper
