package org.zerock.wecart.service;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.zerock.wecart.service.pricecompare.DetailMyPageCartService;

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
public class DetailMyPageCartServiceTests {

	@Setter(onMethod_= {@Autowired})
	private DetailMyPageCartService service;
	
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
		
		Integer cart_id = 2295469;
		
		List<TodayCartGoodsVO> list = this.service.getGoods(cart_id);
		
		assertNotNull(list);
		list.forEach(log::info);
	} //getGoods
	
	//2. 상세 장바구니 상품 마트별 가격 정보
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("TEST 2: getPrices")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void getPrices() throws ServiceException, ParseException {
		log.trace("getPrices invoked()");
		
		Integer goods_id = 1;
		
		String dateString = "23/04/11";
		SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd");
		Date api_date = formatter.parse(dateString);
		
		Integer member_id = 207;
		
		List<TodayCartPriceVO> list = this.service.getPrices(goods_id, api_date, member_id);
		
		assertNotNull(list);		
		list.forEach(log::info);
	} //getPrices
	
	//3. 장바구니 삭제
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("TEST 3: removeCart")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void removeCart() throws ParseException, ServiceException {
		log.trace("removeCart invoked()");
		
		Integer cart_id = 2295469;
		
		int affectedLines = this.service.removeCart(cart_id);
		log.info("affectedLines: {}", affectedLines);
	} //deleteCart
	
	//4. 카트 생성날짜
//	@Disabled
	@Test
	@Order(4)
	@DisplayName("TEST 4: getCreationDate")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void getCreationDate() throws ParseException, ServiceException {
		log.trace("selectCreationDate invoked()");
		
		Integer cart_id = 2295469;
		
		String date = this.service.getCreationDate(cart_id);
		log.info("date: {}", date);
	} //getCreationDate
} //end class
