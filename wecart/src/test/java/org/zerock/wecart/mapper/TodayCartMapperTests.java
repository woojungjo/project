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
import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
import org.zerock.wecart.mapper.pricecompare.TodayCartMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/**/root-*.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TodayCartMapperTests {

	@Setter(onMethod_= {@Autowired})
	private TodayCartMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ this.mapper: {}", this.mapper);
	} //beforeAll
	
	//1. 오늘의 장바구니 상품 정보
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("TEST 1: selectGoods")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectGoods() {
		log.trace("selectGoods invoked()");
		
		Integer member_id = 207;
		
		List<TodayCartGoodsVO> list = this.mapper.selectGoods(member_id);
		
		assertNotNull(list);		
		list.forEach(log::info);
	} //selectGoods
	
	//2. 오늘의 장바구니 상품 마트별 가격 정보
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("TEST 2: selectPrices")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectPrices() {
		log.trace("selectPrices invoked()");
		
		Integer goods_id = 3;
		
		Integer member_id = 207;
		
		List<TodayCartPriceVO> list = this.mapper.selectPrices(goods_id, member_id);
		
		assertNotNull(list);		
		list.forEach(log::info);
	} //selectPrices
} //end class












