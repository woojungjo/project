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
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.service.pricecompare.TodayCartService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/**/root-*.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@Transactional
public class TodayCartServiceTests {

	@Setter(onMethod_= {@Autowired})
	private TodayCartService service;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assert this.service != null;
		log.info("\t+ this.service: {}", this.service);
	} //beforeAll
	
	//1. 오늘의 장바구니 상품 정보
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("TEST 1: getGoods")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void getGoods() throws ServiceException {
		log.trace("getGoods invoked()");
		
		Integer member_id = 207;
		
		List<TodayCartGoodsVO> list = this.service.getGoods(member_id);
		
		assertNotNull(list);
		list.forEach(log::info);
	} //getGoods
	
	//2. 오늘의 장바구니 상품 마트별 가격 정보
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("TEST 2: getPrices")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void getPrices() throws ServiceException {
		log.trace("getPrices invoked()");
		
		Integer goods_id = 3;
		
		Integer member_id = 207;
		
		List<TodayCartPriceVO> list = this.service.getPrices(goods_id, member_id);
		
		assertNotNull(list);		
		list.forEach(log::info);
	} //getPrices
	
	//3. 상품 삭제
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("TEST 3: remove")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void remove() throws ServiceException {
		log.trace("remove invoked()");
		
		Integer goods_id = 1;
		Integer member_id = 207;
		
		int affectedLines = this.service.remove(goods_id, member_id);
		
		log.info("\t+ affectedLines: {}", affectedLines );
	} //remove
	
	//5. 상품 수량 변화
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("TEST 5: modifyAmount")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void modifyAmount() throws ServiceException {
		log.trace("modifyAmount invoked()");
		
		Integer amount = 2;
		Integer goods_id = 1;
		Integer member_id = 207;
		
		int affectedLines = this.service.modifyAmount(amount, goods_id, member_id);
		
		log.info("\t+ affectedLines: {}", affectedLines );
	} //modifyAmount
} //end class







