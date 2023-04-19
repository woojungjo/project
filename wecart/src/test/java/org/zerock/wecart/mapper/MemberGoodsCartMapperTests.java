package org.zerock.wecart.mapper;

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
import org.zerock.wecart.mapper.pricecompare.MemberGoodsCartMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/**/root-*.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class MemberGoodsCartMapperTests {

	
	@Setter(onMethod_= {@Autowired})
	private MemberGoodsCartMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ this.mapper: {}", this.mapper);
	} //beforeAll
	
	
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("Test1: selectAllInstalledCartOfMember")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void selectAllInstalledCartOfMember() {
		log.trace("selectAllCartOfMember() invoked. ");
		
		// member: 198 
		List<Integer> cartList = mapper.selecAllInstalledCartOfMember(198);
		assertNotNull(cartList);
		
		cartList.forEach(log::info);
	} // selectAllCartOfMember
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("Test1: selectAllCartOfMember")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void selectTodayCartOfMember() {
		log.trace("selectAllCartOfMember() invoked. ");
		
		// member: 198 
		Integer todayCartNumber = mapper.selectTodayCartOfMember(198);
		
		if(todayCartNumber != null){
			log.trace("todayCartNumber: {}", todayCartNumber);
		}
	} // selectAllCartOfMember
	
	@Test
	@Order(3)
	@DisplayName("Test1: selectAllCartOfMember")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void insertRowIntoTodayCart() throws ServiceException{
		log.trace("insertRowIntoTodayCart() invoked. ");
		
		try {
			mapper.insertRowIntoTodayCart(198, 77, 2295427);
		}catch(Exception e) {
			throw new ServiceException(e);
		}
		

	} // selectAllCartOfMember
	

} // end class
