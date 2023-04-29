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
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
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
@EnableTransactionManagement
@Transactional
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
	
	//3. 상품 최신 api 날짜 평균 가격 조회
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("TEST 3: selectAvgPrice")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectAvgPrice() {
		log.trace("selectAvgPrice() invoked");
		
		Integer goods_id = 1;
		
		int avg = this.mapper.selectAvgPrice(goods_id);
		
		log.info("\t+ avg: {}", avg);
	} //selectAvgPrice
	
	//4. 장바구니 상품 개별 삭제
//	@Disabled
	@Test
	@Order(4)
	@DisplayName("TEST 4: delete")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void delete() {
		log.trace("delete() invoked");
		
		Integer member_id = 207;
		Integer goods_id = 4;
		
		int affectedLines = this.mapper.delete(goods_id, member_id);
		
		log.info("\t+ affectedLines: {}", affectedLines);
	} //delete
	
	//5. 장바구니 상품 선택 삭제
//	@Disabled
	@Test
	@Order(5)
	@DisplayName("TEST 5: deleteChecked")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void deleteChecked() {
		log.trace("deleteChecked() invoked");
		
		int[] goodsIdArr = {1, 2};
		Integer member_id = 207;
		
		int affectedLines = this.mapper.deleteChecked(goodsIdArr, member_id);
		
		log.info("\t+ affectedLines: {}", affectedLines);
	} //deleteChecked
	
	//6. 오늘의 장바구니 -> 마이페이지 상세 장바구니
//	@Disabled
	@Test
	@Order(6)
	@DisplayName("TEST 6: updateStatus")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void updateStatus() {
		log.trace("updateStatus() invoked");
		
		Integer member_id = 207;
		
		int affectedLines = this.mapper.updateStatus(member_id);
		
		log.info("\t+ affectedLines: {}", affectedLines);
	} //updateStatus
	
	//6. 오늘의 장바구니 상품 수량 변화
//	@Disabled
	@Test
	@Order(7)
	@DisplayName("TEST 7: updateAmount")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void updateAmount() {
		log.trace("updateAmount() invoked");
		
		Integer amount = 2;
		Integer goods_id = 1;
		Integer member_id = 207;
		
		int affectedLines = this.mapper.updateAmount(amount, goods_id, member_id);
		
		log.info("\t+ affectedLines: {}", affectedLines);
	} //updateAmount
} //end class












