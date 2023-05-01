package org.zerock.wecart.service.board.qnaboard;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
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
import org.zerock.wecart.exception.ServiceException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)

@ExtendWith(SpringExtension.class	)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/root-*.xml")
public class QnaBoardServiceTests {

	@Setter(onMethod_= {@Autowired})
	private QnaBoardCommentService service;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assertNotNull(this.service);
		log.info("\t+ service : {}", this.service);
	} // beforeAll
	
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("testLike")
	void testLike() throws ServiceException {
		
		QnaBoardCommentDTO dto = new QnaBoardCommentDTO();
		dto.setPost_no(99990);
		dto.setComment_no(222229);
		dto.setMember_id(198);
		
		service.commentLike(dto);
		
		
	} // testGetList
	
	
} // end class
