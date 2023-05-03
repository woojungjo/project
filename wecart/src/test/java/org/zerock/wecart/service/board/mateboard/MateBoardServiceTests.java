package org.zerock.wecart.service.board.mateboard;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.zerock.wecart.domain.mateboard.MateBoardDTO;
import org.zerock.wecart.domain.mateboard.MateBoardVO;
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
public class MateBoardServiceTests {

	@Setter(onMethod_= {@Autowired})
	private MateBoardService service;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked");
		
		Objects.nonNull(this.service);
//		assert this.mapper !=null;
//		assertNotNull(this.mapper);
		
		log.info("this.mapper:{}, {}", this.service, this.service.getClass().getName());
	}//beforeAll
	
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("testGetList")
	@Timeout(value = 30, unit = TimeUnit.SECONDS)
	void testGetList() throws ServiceException {
		log.trace("testGetList() invoked.");
		
		Criteria cri = new Criteria();
		cri.setCurrPage(2);
		cri.setAmount(20);
//		cri.setSort("views");
		
		List<MateBoardVO> list = this.service.getList(cri);
		
		assert list != null;
		list.forEach(log::info);
	} // testGetList
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("testGetTotalAmount()")
	@Timeout(value=3, unit=TimeUnit.SECONDS)
	void testGetTotalAmount() throws ServiceException {
		log.trace("testGetTotalAmount() invoked");
		
		int totalAmount= this.service.getTotalAmount();
		
		log.info("\\t+totalAmount:{}", totalAmount);
			
	}//testGetTotalAmount
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("testGet")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void testGet() throws ServiceException {
		log.trace("testGet() invoked.");
		
//		Integer post_no = 77;
		int  post_no = 77;//autoboxing
		MateBoardVO vo = this.service.get(post_no);
		
		if(vo !=null) {
			log.info("\t+vo:{}", vo);
		}else {
			throw new ServiceException("MateBoardVO is null");
		}//if-else
	} // testGet
	
	//Disabled
	@Test
	@Order(4)
	@DisplayName("testUpdate")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testModify() throws ServiceException {
		log.trace("testModify() invoked.");
		
		MateBoardVO vo = this.service.get(222273);
		MateBoardDTO dto = new MateBoardDTO();
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		LocalDateTime localDateTime = timestamp.toLocalDateTime();
		
		dto.setPost_no(vo.getPost_no());
		dto.setTitle("NEW 77 LONDON");
		dto.setContent("77 LONDON");
		dto.setViews(vo.getViews());
		dto.setMember_id(vo.getMember_id());
		dto.setMeeting_status('0');
		dto.setMeeting_area("LONDON");
		dto.setReport_cnt(0);
		dto.setParticipant_id_1(300);
		dto.setParticipant_id_2(301);
		dto.setParticipant_id_3(303);
		dto.setMeeting_time(localDateTime);
		
		boolean success = this.service.modify(dto);
		log.info("\t+success", success);
		
	}//testModify()
	
	//Disabled
	@Test
	@Order(4)
	@DisplayName("testRegister")
	@Timeout(value=10, unit=TimeUnit.SECONDS)
	void testRegister() throws ServiceException {
		log.trace("testRegister() invoked.");
		
		MateBoardDTO dto = new MateBoardDTO();
		//Timestamp now = new Timestamp(System.currentTimeMillis());

//		String meetingTime = "2023-05-15T19:44 AM";
//		LocalDateTime localDateTime = LocalDateTime.parse(meetingTime);
//		Timestamp timestamp = Timestamp.valueOf(localDateTime);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm a");
		LocalDateTime dateTime = LocalDateTime.parse("2023-05-15 07:44 PM", formatter);
		Timestamp timestamp = Timestamp.valueOf(dateTime);
		
		dto.setTitle("test777");
		dto.setContent("0502test_CONTENT");
		dto.setViews(1000);
		dto.setMember_id(777);
		dto.setMeeting_status(String.valueOf(0).charAt(0));
		dto.setMeeting_area("JeJu");
		dto.setMeeting_time(dateTime);
		dto.setReport_cnt(0);
		dto.setParticipant_id_1(335);
		dto.setParticipant_id_2(337);
		dto.setParticipant_id_3(379);
		
		boolean success = this.service.register(dto);
		log.info("\t+success", success);
		
	}//testRegister()
	
//	@Disabled
	@Test
	@Order(5)
	@DisplayName("testRemove()")
	@Timeout(value=3, unit=TimeUnit.SECONDS)
	void testRemove() throws ServiceException {
		log.trace("testRemove() invoked");
		
		int post_no = 222239; 
		boolean success = this.service.remove(post_no);

		log.info("\t+success:{}", success);
	}//testRemove
	
} //MateBoardServiceTests
