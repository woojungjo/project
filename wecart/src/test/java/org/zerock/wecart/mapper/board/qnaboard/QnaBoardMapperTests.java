package org.zerock.wecart.mapper.board.qnaboard;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.Timeout;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardDTO;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@TestInstance(Lifecycle.PER_CLASS)

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/root-*.xml")

public class QnaBoardMapperTests {

	@Setter(onMethod_= {@Autowired})
	private QnaBoardMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		log.info("\t+ this.mapper : {}, type: {}", this.mapper, this.mapper.getClass().getName());
		
		
	}
	
	
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
	
	@Test
	@Order(2)
	void qnaBoardMapperSearchTest() {
		log.trace("qnaBoardMapperTest() invoked.");
		
		Criteria cri = new Criteria();
		cri.setSort("views");
		cri.setType("title");
//		cri.setType("member_id");
		cri.setKeyword("198");
		
		List<QnaBoard_CommentCountVO> list = this.mapper.selectAll(cri);
		assertNotNull(list);
		
		list.forEach(log::info);
		
		
	} // qnaBoardMapperTest
	
	@Test
	@Order(3)
	void qnaBoardMapperReadTest() {
		log.trace("qnaBoardMapperReadTest() invoked.");
		
		Integer post_no = 1;
		
		QnaBoardVO vo = this.mapper.read(post_no);
		assertNotNull(vo);
		
		log.info("vo : {}", vo);
		
		
	} // qnaBoardMapperReadTest
	@Test
	@Order(4)
	void qnaBoardMapperUpdateViewsTest() {
		log.trace("qnaBoardMapperUpdateViewsTest() invoked.");
		
		Integer post_no = 222227;
		
		this.mapper.updateViews(post_no);
		
		
	} // qnaBoardMapperReadTest
	
//	@Disabled
	@Test
	@Order(5)
	@DisplayName("신규 게시물 등록 : qnaBoardMapperInsertTest")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void qnaBoardMapperInsertTest() {
		log.trace("qnaBoardMapperInsertTest() invoked.");
		
		QnaBoardDTO dto = new QnaBoardDTO();

		dto.setTitle("Ju's");
		dto.setContent("Ju_New_Content");
		dto.setViews(1000000000);
		dto.setMember_id(333);
		dto.setSecret_yn(1);
		
		Integer afftectedLines = this.mapper.insert(dto);
		assertNotNull(afftectedLines);
		
		log.info("afftectedLines:{}", afftectedLines);
		
	}//mateBoardMapperInsertTest() 
	
	@Test
	@Order(4)
	@DisplayName("게시물 수정 : qnaBoardMapperuUpdateTest")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void qnaBoardMapperuUpdateTest() {
		log.trace("qnaBoardMapperuUpdateTest() invoked.");
		
		QnaBoardVO vo = this.mapper.read(299);
		QnaBoardDTO dto = new QnaBoardDTO();
		
		dto.setPost_no(vo.getPost_no());
		dto.setTitle("TEST_UPDATE");
		dto.setContent("TEST_UPDATE");
		dto.setViews(vo.getViews());
		dto.setMember_id(vo.getMember_id());
		dto.setSecret_yn(0);
		
		Integer affectedLines = this.mapper.update(dto);
		
		assertNotNull(affectedLines);
		log.info("***********afftedLines:{}", affectedLines);
	}//qnaBoardMapperuUpdateTest()
	
}//end class 
