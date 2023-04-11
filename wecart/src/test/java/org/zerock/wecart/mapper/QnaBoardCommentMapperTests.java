package org.zerock.wecart.mapper;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
import java.util.Objects;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;
import org.zerock.wecart.mapper.board.qnaboard.QnaBoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@TestInstance(Lifecycle.PER_CLASS)

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/root-*.xml")

public class QnaBoardCommentMapperTests {

	@Setter(onMethod_= {@Autowired})
	private QnaBoardMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		log.info("\t+ this.mapper : {}, type: {}", this.mapper, this.mapper.getClass().getName());
		
	}
	
	
//	댓글 받아오는거 테스트부터
	@Test
	@Order(1)
	void qnaBoardMapperSelectAllTest() {
		log.trace("qnaBoardMapperSelectAllTest() invoked.");
		
		Criteria cri = new Criteria();
		cri.setCurrPage(2);
//		cri.setAmount(20);
		cri.setSort("views");
		
		List<QnaBoard_CommentCountVO> list = this.mapper.selectAll(cri);
		assertNotNull(list);
		
		list.forEach(log::info);
	
		
	} // qnaBoardMapperSelectAllTest
		
}
