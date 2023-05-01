package org.zerock.wecart.service.board.qnaboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardDTO;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.board.qnaboard.QnaBoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service("boardService")
public class QnaBoardServiceImpl implements QnaBoardService{

	@Setter(onMethod_= {@Autowired})
	private QnaBoardMapper mapper;
	
//	@Setter(onMethod_= {@Autowired})
//	private QnaBoardCommentMapper commentMapper;
	
	
	@Override
	public List<QnaBoard_CommentCountVO> getList(Criteria cri) throws ServiceException { // 게시판 목록조회
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
	public QnaBoardVO get(Integer post_no) throws ServiceException { // 게시물 상세조회
		log.trace("get() invoked.");
		
		try {
			
			this.mapper.updateViews(post_no);
			QnaBoardVO qnaBoardVO = this.mapper.read(post_no);
			
			return qnaBoardVO;
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	}


	@Override
	public boolean register(QnaBoardDTO dto) throws ServiceException {
		log.trace("register() invoked.");
		
		try {
			return this.mapper.insert(dto)==1;
		}catch(Exception e) {
			throw new ServiceException(e);
		}//try-catch
	} // register() 

} // end class
