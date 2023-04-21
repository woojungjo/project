package org.zerock.wecart.service.town;

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
public class TownServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private TownService service;

	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked");
		
		Objects.nonNull(this.service);
		log.info("this.mapper:{}, {}", this.service, this.service.getClass().getName());
	}//beforeAll
	
	//Disabled
	@Test
	@Order(1)
	@DisplayName("testUpdate")
	@Timeout(value=3, unit=TimeUnit.SECONDS)
	void testUpdate() throws ServiceException {
		log.trace("testUpdate() invoked.");
		
        String townName = "New York";
        String loginId = "loginid3";
        
		boolean success = this.service.update(townName,loginId);
		log.info("\t+success", success);
		
	}//testUpdate
}//TownServiceTests
