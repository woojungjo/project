package org.zerock.wecart.mapper.board.mateboard;

import java.util.List;

import org.zerock.wecart.domain.mateboard.MateBoardVO;

public interface MateBoardMapper {
		
	// 전체 목록 조회, 페이징 처리 전 
	public abstract List<MateBoardVO> selectAll();
	
	
}//MateBoardMapper
