package org.zerock.wecart.service.board.saleboard;

import java.util.List;

import org.zerock.wecart.domain.saleboard.SaleBoardCommentDTO;
import org.zerock.wecart.domain.saleboard.SaleBoardCommentVO;
import org.zerock.wecart.exception.ServiceException;

public interface SaleBoardCommentService {

	
	// 1. 댓글 전체목록 조회 (LIST)
	public abstract List<SaleBoardCommentVO> getList(Integer post_no) throws ServiceException;
	
	
	// 3. 특정 댓글 삭제 (DELETE)
	public abstract boolean remove(Integer comment_no) throws ServiceException;
	
	// 4. 새로운 댓글 등록(CREATE)
	public abstract boolean register(SaleBoardCommentDTO dto) throws ServiceException;
	
	// 5. 기존 게시물 수정(MODIFY)
//	public abstract boolean modify(BoardDTO dto) throws ServiceException;
	
	// 6. 현재 총 게시물 건수 반환
//	public abstract Integer getTotalAmount(Integer post_no) throws ServiceException;
	
	// 좋아요 눌렀는지 확인하고 안눌럿으면 업 눌럿으면 다운
	public abstract void commentLike(SaleBoardCommentDTO dto) throws ServiceException;
	
	// 댓글 수정
	public abstract void commentModify(SaleBoardCommentDTO dto) throws ServiceException;
	
	
} // end interface
