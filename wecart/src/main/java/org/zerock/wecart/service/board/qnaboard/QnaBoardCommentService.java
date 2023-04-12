package org.zerock.wecart.service.board.qnaboard;

import java.util.List;

import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;
import org.zerock.wecart.exception.ServiceException;

public interface QnaBoardCommentService {

	
	// 1. 게시물 전체목록 조회 (LIST)
	public abstract List<QnaBoard_CommentCountVO> getList(Criteria cri) throws ServiceException;
	
	// 2. 특정 게시물 상세조회 (READ)
	public abstract QnaBoardVO get(Integer post_no) throws ServiceException;
	
	// 3. 특정 게시물 삭제 (DELETE)
//	public abstract boolean remove(Integer bno) throws ServiceException;
	
	// 4. 새로운 게시물 등록(CREATE)
//	public abstract boolean register(BoardDTO dto) throws ServiceException;
	
	// 5. 기존 게시물 수정(MODIFY)
//	public abstract boolean modify(BoardDTO dto) throws ServiceException;
	
	// 6. 현재 총 게시물 건수 반환
	public abstract Integer getTotalAmount() throws ServiceException;
	
	
} // end interface
