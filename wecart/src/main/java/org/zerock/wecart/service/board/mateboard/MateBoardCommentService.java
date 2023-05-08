package org.zerock.wecart.service.board.mateboard;

import java.util.List;

import org.zerock.wecart.domain.board.MateBoardCommentDTO;
import org.zerock.wecart.domain.board.MateBoardCommentVO;
import org.zerock.wecart.exception.ServiceException;

public interface MateBoardCommentService {

	
	// 1. 댓글 전체목록 조회 (LIST)
	public abstract List<MateBoardCommentVO> getList(Integer post_no) throws ServiceException;
	
	// 3. 특정 댓글 삭제 (DELETE)
	public abstract boolean remove(Integer comment_no) throws ServiceException;
	
	// 4. 새로운 댓글 등록(CREATE)
	public abstract boolean register(MateBoardCommentDTO dto) throws ServiceException;
	
	// 6. 현재 총 게시물 건수 반환
	public abstract Integer getTotalAmount(Integer post_no) throws ServiceException;
	
	// 좋아요 눌렀는지 확인하고 안눌럿으면 업 눌럿으면 다운
	public abstract void commentLike(MateBoardCommentDTO dto) throws ServiceException;
	
	// 댓글 수정
	public abstract void commentModify(MateBoardCommentDTO dto) throws ServiceException;
	
	
} // end interface
