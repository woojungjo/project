package org.zerock.wecart.mapper.board.qnaboard;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardVO;

public interface QnaBoardMapper {

//	@Select("""
//			SELECT a.*, COALESCE(b.comment_count, 0) as comment_count
//			FROM QNA_BOARD a
//			LEFT OUTER JOIN (
//			SELECT post_no as tmp, COUNT(*) as comment_count
//			FROM qna_board_comment
//			GROUP BY post_no
//			) b 
//			ON (a.POST_NO = b.tmp)
//			ORDER BY a.POST_NO DESC
//			OFFSET (#{currPage}-1) * #{amount} ROWS
//			FETCH NEXT #{amount} ROWS ONLY
//			""")
	public abstract List<QnaBoardVO> selectAll(Criteria cri);
	
	@Select("SELECT COUNT(*) FROM qna_board WHERE post_no > 0")
	public abstract Integer selectTotalCount();
	
	
} // end interface
