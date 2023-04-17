package org.zerock.wecart.service.board.mateboard;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.mateboard.MateBoardVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.board.mateboard.MateBoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@ToString
@Log4j2
@NoArgsConstructor

@Service("mateBoardService")
public class MateBoardServiceImpl implements MateBoardService, InitializingBean{
	
	@Setter(onMethod_= {@Autowired})
	private MateBoardMapper mapper;
	
	//빈, 주입잘 받았는지 체크 필요. 
	@Override
	public void afterPropertiesSet() throws Exception {
		log.trace("afterPropertiesSet() invoked");
		
		try {
			Objects.requireNonNull(this.mapper);//ServiceException으로 매핑해서 던지도록 
		}catch(Exception e) {
			throw new ServiceException(e);
		}//try-catch
	}//afterPropertiesSet() 

	//게시판 목록조회 
	@Override 
	public List<MateBoardVO> getList(Criteria cri) throws ServiceException {
		log.trace("getList()invoked");
		
		try {
			return this.mapper.selectAll(cri);
		}catch(Exception e) {
			throw new ServiceException(e);
		}//try-catch 
	}//getList
	
	@Override 
	public Integer getTotalAmount() throws ServiceException { 
		log.trace("getTotalAmount() invoked.");
		
		try {
			return this.mapper.selectTotalCount();
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
		
	}

	@Override
	public MateBoardVO get(Integer post_no) throws ServiceException {
		log.trace("get() invoked.");
		try {
			return this.mapper.select(post_no);
		}catch(Exception e) {
			throw new ServiceException(e);
		}//try-catch
	} // getTotalAmount
	
	
 
}//end class 
