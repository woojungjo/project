package org.zerock.wecart.mapper;

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
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
import org.zerock.wecart.mapper.pricecompare.DetailMyPageCartMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/**/root-*.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@EnableTransactionManagement
@Transactional
public class DetailMyPageCartMapperTests {

	@Setter(onMethod_= {@Autowired})
	private DetailMyPageCartMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ this.mapper: {}", this.mapper);
	} //beforeAll
	
	//1. 상세 장바구니 상품 정보
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("TEST 1: selectGoods")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectGoods() {
		log.trace("selectGoods invoked()");
		
		Integer cart_id = 2295469;
		
		List<TodayCartGoodsVO> list = this.mapper.selectGoods(cart_id);
		
		assertNotNull(list);		
		list.forEach(log::info);
	} //selectGoods
	
	//2. 상세 장바구니 마트별 상품 가격
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("TEST 2: selectGoods")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectPrices() throws ParseException {
		log.trace("selectPrices invoked()");
		
		Integer goods_id = 1;
		
		String dateString = "23/04/11";
		SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd");
		Date api_date = formatter.parse(dateString);
		
		Integer member_id = 207;
		
		List<TodayCartPriceVO> list = this.mapper.selectPrices(goods_id, api_date, member_id);
		
		assertNotNull(list);		
		list.forEach(log::info);
	} //selectPrices
	
	//3. 상세 장바구니 마트별 상품 가격
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("TEST 3: selectAvgPrice")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectAvgPrice() throws ParseException {
		log.trace("selectAvgPrice invoked()");
		
		Integer goods_id = 1;
		
		String dateString = "23/04/11";
		SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd");
		Date api_date = formatter.parse(dateString);
		
		int avg_price = this.mapper.selectAvgPrice(goods_id, api_date);
		
		log.info("avg_price: {}", avg_price);
	} //selectAvgPrice
} //end class




