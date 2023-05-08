package org.zerock.wecart.service.board.mateboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.board.MateBoardCommentDTO;
import org.zerock.wecart.domain.board.MateBoardCommentVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.board.mateboard.MateBoardCommentMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service("mateboardCommentService")
public class MateBoardCommentServiceImpl implements MateBoardCommentService {

	@Setter(onMethod_= {@Autowired})
	private MateBoardCommentMapper commentMapper;
	
	
	@Override
	public List<MateBoardCommentVO> getList(Integer post_no) throws ServiceException {
		
		List<MateBoardCommentVO> commentVO = commentMapper.selectAll(post_no);

		
		return commentVO;
	}

	@Override
	public Integer getTotalAmount(Integer post_no) throws ServiceException {
		
		Integer commentCnt = commentMapper.countComment(post_no);
		
		return commentCnt;
	}

	@Transactional
	@Override
	public boolean register(MateBoardCommentDTO dto) throws ServiceException {
		
		
		if(dto.getComment_root() != null) {
			commentMapper.updateCommentStepIndent(dto);
		}
		
		boolean result = commentMapper.insertComment(dto);
		
		return result;
	}

	@Override
	public boolean remove(Integer comment_no) throws ServiceException {
		
		boolean result = commentMapper.deleteComment(comment_no);
		
		return result;
	}

	@Override
	public void commentLike(MateBoardCommentDTO dto) throws ServiceException {
		
		Integer result = this.commentMapper.commentAlreadyLIke(dto);
		
		
		if(result != 0) {
			this.commentMapper.commentLIkeDOWN(dto);
		} else {
			this.commentMapper.commentLIkeUP(dto);
		}
		
	}

	@Override
	public void commentModify(MateBoardCommentDTO dto) throws ServiceException {

		this.commentMapper.updateComment(dto);
	}
	
	

}
