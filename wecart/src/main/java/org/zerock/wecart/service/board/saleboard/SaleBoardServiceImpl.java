package org.zerock.wecart.service.board.saleboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.saleboard.SaleBoardDTO;
import org.zerock.wecart.domain.saleboard.SaleBoardListVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.board.saleboard.SaleBoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service("saleBoardService")
public class SaleBoardServiceImpl implements SaleBoardService{

	@Setter(onMethod_= {@Autowired})
	private SaleBoardMapper mapper;
	
//	@Setter(onMethod_= {@Autowired})
//	private QnaBoardCommentMapper commentMapper;
	
	
	@Override
	public List<SaleBoardListVO> getList(Criteria cri) throws ServiceException { // 게시판 목록조회
		log.trace("getList() invoked.");
		
		try {
			return this.mapper.selectAll(cri);
		} catch(Exception e)	{
			throw new ServiceException(e);
		} // try-catch
		
	}


	@Override
	public Integer getTotalAmount() throws ServiceException { // 게시판 페이징용 전체글수 조회 
		log.trace("getTotalAmount() invoked.");
		
		try {
			return this.mapper.selectTotalCount();
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
		
	} // getList


	@Transactional
	@Override
	public SaleBoardListVO get(Integer post_no) throws ServiceException { // 게시물 상세조회
		log.trace("get() invoked.");
		
		try {
			
			this.mapper.updateViews(post_no);
			SaleBoardListVO saleBoardVO = this.mapper.read(post_no);
			
			return saleBoardVO;
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	}


	@Override
	public void postLike(SaleBoardDTO dto) throws ServiceException {
		Integer result = this.mapper.alreadyLIke(dto);
		
		
		if(result != 0) {
			this.mapper.lIkeDOWN(dto);
		} else {
			this.mapper.lIkeUP(dto);
		}
		
	}


	@Override
	public void postHate(SaleBoardDTO dto) throws ServiceException {
		Integer result = this.mapper.alreadyHate(dto);
		
		
		if(result != 0) {
			this.mapper.hateDOWN(dto);
		} else {
			this.mapper.hateUP(dto);
		}
		
	}


	@Override
	public void remove(Integer post_no) throws ServiceException {
		
		this.mapper.delete(post_no);
		
	}
//
//
//	@Override
//	public boolean register(QnaBoardDTO dto) throws ServiceException {
//		log.trace("register() invoked.");
//		
//		try {
//			return this.mapper.insert(dto)==1;
//		}catch(Exception e) {
//			throw new ServiceException(e);
//		}//try-catch
//	} // register() 
	
	
} // end class
