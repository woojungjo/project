package org.zerock.wecart.mapper.board.qnaboard;

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
import org.zerock.wecart.domain.board.QnaBoardCommentDTO;
import org.zerock.wecart.domain.board.QnaBoardCommentVO;

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
	private QnaBoardCommentMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		log.info("\t+ this.mapper : {}, type: {}", this.mapper, this.mapper.getClass().getName());
		
	}
	
	
	@Test
	@Order(1)
	void commentTest() {
		log.trace("commentTest() invoked.");
		
		Integer post_no = 1;
		
		List<QnaBoardCommentVO> list = this.mapper.selectAll(post_no);
		
		Integer cnt = this.mapper.countComment(post_no);
		
		assertNotNull(list);
		
		list.forEach(log::info);
	
	} // commentTest
	
	@Test
	@Order(1)
	void insertCommentTest() {
		log.trace("insertCommentTest() invoked.");
		
		QnaBoardCommentDTO dto = new QnaBoardCommentDTO();
		
		dto.setPost_no(222227);
		dto.setMember_id(333);
		dto.setSecret_yn(0);
		dto.setContent("comment Test pls");
		dto.setDelete_yn(0);
		dto.setComment_indent(0);
		dto.setComment_step(0);
		
		log.info("before DTO: {}", dto);
		boolean result = this.mapper.insertComment(dto);
		log.info("after DTO: {}", dto);

		
		log.info("result: {}", result);
		
	} // insertCommentTest
	
	@Test
	@Order(1)
	void deleteCommentTest() {
		
		this.mapper.deleteComment(10);
		
	
		
	} // insertCommentTest
	
	@Test
	@Order(1)
	void alreadyLikeTest() {
		
		QnaBoardCommentDTO dto = new QnaBoardCommentDTO();
		dto.setPost_no(99990);
		dto.setComment_no(222229);
		dto.setMember_id(198);
		
		Integer result = this.mapper.commentAlreadyLIke(dto);
		log.info("result : " , result);
		
		
	} // insertCommentTest
		
}
