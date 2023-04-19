package org.zerock.wecart.service;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
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
import org.zerock.wecart.service.pricecompare.MypageCartService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/**/root-*.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class MypageCartServiceTests {
	
	@Autowired
	private MypageCartService service;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assert this.service != null;
		log.info("\t+ this.service: {}", this.service);
	} //beforeAll
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("Test1: getInstalledCartIdsOfMember()")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void getInstalledCartIdsOfMember() throws ServiceException {
		log.trace("getInstalledCartIdsOfMember() invoked.");
		
		
		List<Integer> list = this.service.getInstalledCartIdsOfMember(198);
		assertNotNull(list);
		
		log.info("\t + list: {}", list);
	} //MemberGoodsCartListForMember
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("Test2: getTodayCartIdOfMember()")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void getTodayCartIdOfMember() throws ServiceException {
		log.trace("getTodayCartIdOfMember() invoked.");
		
		Integer member_id = 198;
		
		Integer cart_id = this.service.getTodayCartIdOfMember(member_id);
		
		if(cart_id != null) {
			log.info("\t + list: {}", cart_id);
		}else {
			log.info("해당 회원은 TodayCart를 가지고 있지 않습니다.");
		} // if - else
		
	} //MemberGoodsCartListForMember
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("Test3: getTodayCartIdOfMember()")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void saveGoodsIntoTodayCart() throws ServiceException {
		log.trace("getTodayCartIdOfMember() invoked.");
		
		try {
			
			this.service.saveGoodsIntoTodayCart(198, 100, 2295427);
			
		}catch(Exception e) {
			throw new ServiceException(e);
		}
	} //MemberGoodsCartListForMember
}
