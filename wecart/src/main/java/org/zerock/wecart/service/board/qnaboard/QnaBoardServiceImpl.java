package org.zerock.wecart.service.board.qnaboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.wecart.domain.board.Criteria;
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
	
	
	@Override
	public List<QnaBoard_CommentCountVO> getList(Criteria cri) throws ServiceException {
		log.trace("getList() invoked.");
		
		try {
			return this.mapper.selectAll(cri);
		} catch(Exception e)	{
			throw new ServiceException(e);
		} // try-catch
		
	}


	@Override
	public Integer getTotalAmount() throws ServiceException {
		log.trace("getTotalAmount() invoked.");
		
		try {
			return this.mapper.selectTotalCount();
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
		
	} // getList


	@Override
	public QnaBoardVO get(Integer post_no) throws ServiceException {
		log.trace("getTotalAmount() invoked.");
		
		try {
			return this.mapper. read(post_no);
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // get

} // end class
