package org.zerock.wecart.service.board.mateboard;

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
	
	
} //MateBoardServiceTests
