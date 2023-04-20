package org.zerock.wecart.mapper;

import java.sql.Timestamp;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.Timeout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.wecart.mapper.pricecompare.CartMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/**/root-*.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CartMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private CartMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforAll() invoked. ");
		
		assert this.mapper != null;
		log.info("\t+ this.mapper: {}", this.mapper);
	}// beforAll()
	
//	@Disable
	@Test
	@Order(1)
	@DisplayName("Test: insertAndSelectCartId")
	@Timeout(value=3, unit=TimeUnit.SECONDS)
	void insertAndSelectCartId() {
		log.trace("insertCart() invoked.");
		
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		this.mapper.insertAndSelectCartId(currentTime, currentTime, "NotYet");
		
		log.trace("insertCart 실행 후 log 입니다.");
	}// insertCart
	
	
} // end class
