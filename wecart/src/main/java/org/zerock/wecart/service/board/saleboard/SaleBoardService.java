package org.zerock.wecart.service.board.saleboard;

import java.util.List;

import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.saleboard.SaleBoardDTO;
import org.zerock.wecart.domain.saleboard.SaleBoardListVO;
import org.zerock.wecart.exception.ServiceException;

public interface SaleBoardService {

	
	// 1. 게시물 전체목록 조회 (LIST)
	public abstract List<SaleBoardListVO> getList(Criteria cri) throws ServiceException;
	
	// 2. 특정 게시물 상세조회 (READ)
	public abstract SaleBoardListVO get(Integer post_no) throws ServiceException;
	
	// 3. 특정 게시물 삭제 (DELETE)
	public abstract void remove(Integer post_no) throws ServiceException;
//	
//	// 4. 새로운 게시물 등록(CREATE)
//	public abstract boolean register(QnaBoardDTO dto) throws ServiceException;
//	
//	// 5. 기존 게시물 수정(MODIFY)
////	public abstract boolean modify(BoardDTO dto) throws ServiceException;
	
	// 6. 현재 총 게시물 건수 반환
	public abstract Integer getTotalAmount() throws ServiceException;
	
	// 좋아요 눌렀는지 확인하고 안눌럿으면 업 눌럿으면 다운
	public abstract void postLike(SaleBoardDTO dto) throws ServiceException;
	
	// 싫어요 눌렀는지 확인하고 안눌럿으면 업 눌럿으면 다운
	public abstract void postHate(SaleBoardDTO dto) throws ServiceException;
	
	
} // end interface
