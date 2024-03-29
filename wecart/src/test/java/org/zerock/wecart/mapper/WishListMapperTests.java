package org.zerock.wecart.mapper;

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
import org.zerock.wecart.domain.pricecompare.GooodsVO;
import org.zerock.wecart.mapper.pricecompare.WishListMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/**/root-*.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class WishListMapperTests {

	@Setter(onMethod_= {@Autowired})
	private WishListMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ this.mapper: {}", this.mapper);
	} //beforeAll
	
//	@Disable
	@Test
	@Order(1)
	@DisplayName("Test1: insertGoodsIntoWishedCart")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void insertGoodsIntoWishedCart() {
		log.trace("insertGoodsIntoWishedCart() invoked. ");
		
		this.mapper.insertGoodsIntoWishedCart(198, 100);
		
		
	} // insertGoodsIntoWishedCart
	
//	@Disable
	@Test
	@Order(2)
	@DisplayName("Test2: deleteGoodsFromWishedCart")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void deleteGoodsFromWishedCart() {
		log.trace("deleteGoodsFromWishedCart() invoked. ");
		
		this.mapper.deleteGoodsFromWishedCart(198, 100);
		
		
	} // deleteGoodsFromWishedCart
	
	
//	@Disable
	@Test
	@Order(3)
	@DisplayName("Test3: selectGooodVoOfMember")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectGooodVoOfMember() {
		log.trace("selectGooodVoOfMember() invoked. ");
		
		List<GooodsVO> goodsObject = this.mapper.selectGooodVoOfMember(198);
		
		log.trace("goodsObject: {}", goodsObject);
		
	} // deleteGoodsFromWishedCart
	

	//	@Disabled
	@Test
	@Order(4)
	@DisplayName("Test: selectCheckingGooodsVoOfMember")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void selectCheckingGooodsVoOfMember() {
		log.trace("selectCheckingGooodsVoOfMember() invoked.");
		
		Integer installedGoodsId = this.mapper.selectCheckingGooodsVoOfMember(199, 6);
		Integer notInstalledGoodsId = this.mapper.selectCheckingGooodsVoOfMember(199, 77);
		
		log.trace("installedGoodsId: {}, notInstalledGoodsId: {}", installedGoodsId, notInstalledGoodsId);
		
	}//selectGooodsVO() 
} // end class
