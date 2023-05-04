package org.zerock.wecart.mapper.board.saleboard;

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
import org.zerock.wecart.domain.saleboard.SaleBoardListVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@TestInstance(Lifecycle.PER_CLASS)

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/root-*.xml")

public class SaleBoardMapperTests {

	@Setter(onMethod_= {@Autowired})
	private SaleBoardMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		log.info("\t+ this.mapper : {}, type: {}", this.mapper, this.mapper.getClass().getName());
		
		
	}
	
	
	@Test
	@Order(1)
	void qnaBoardMapperSelectAllTest() {
		log.trace("saleBoardMapperSelectAllTest() invoked.");
		
		Criteria cri = new Criteria();
		cri.setCurrPage(1);
//		cri.setAmount(20);
		cri.setSort("views");
		
		List<SaleBoardListVO> list = this.mapper.selectAll(cri);
		assertNotNull(list);
		
		list.forEach(log::info);
	
		
	} // qnaBoardMapperSelectAllTest
	
	
}
