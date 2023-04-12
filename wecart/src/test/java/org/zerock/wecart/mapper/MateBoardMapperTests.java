package org.zerock.wecart.mapper;

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
import org.zerock.wecart.domain.mateboard.MateBoardVO;
import org.zerock.wecart.mapper.board.mateboard.MateBoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/root-*.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class MateBoardMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	private MateBoardMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked");
		
		Objects.nonNull(this.mapper);
		assert this.mapper !=null;
		assertNotNull(this.mapper);
		
		log.info("this.mapper:{}, {}", this.mapper, this.mapper.getClass().getName());
	}//beforeAll
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("페이징처리전: mateBoardMapperSelectAllTest")
	@Timeout(value=10, unit=TimeUnit.SECONDS)
	void mateBoardMapperSelectAllTest() {
		log.trace("mateBoardMapperSelectAllTest() invoked.");
		
		List<MateBoardVO> list = this.mapper.selectAll();
		
		assertNotNull(list);
		list.forEach(log::info);
		
	}//mateBoardMapperSelectAllTest() 
	
}//MateBoardMapperTests
 