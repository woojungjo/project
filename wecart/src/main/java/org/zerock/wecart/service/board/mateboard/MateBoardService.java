package org.zerock.wecart.service.board.mateboard;

import java.util.List;

import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.mateboard.MateBoardVO;
import org.zerock.wecart.exception.ServiceException;

public interface MateBoardService {

	// 1. 게시물 전체목록 조회 (LIST)
	public abstract List<MateBoardVO> getList(Criteria cri) throws ServiceException;
	
	// 6. 현재 총 게시물 건수 반환
	public abstract Integer getTotalAmount() throws ServiceException;
	
}//MateBoardService
