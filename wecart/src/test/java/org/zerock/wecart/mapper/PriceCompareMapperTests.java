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
import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.mapper.pricecompare.PriceCompareMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/**/root-*.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class PriceCompareMapperTests {

	@Setter(onMethod_= {@Autowired})
	private PriceCompareMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ this.mapper: {}", this.mapper);
	} //beforeAll
	
	//1. 상품 전체조회(+페이징처리 +정렬)
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("Test1: selectAll")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectAll() {
		log.trace("selectAll() invoked.");
		
		GoodsCriteria cri = new GoodsCriteria();
		cri.setCurrPage(1);
		cri.setAmount(20);
//		cri.setSort("popular");
//		cri.setSort("low");
//		cri.setSort("high");
		
		
		List<GoodsVO> list = this.mapper.selectAll(cri);
		assertNotNull(list);
		
		list.forEach(log::info);	
		
	} //selectAll
	

	@Test
	@Order(2)
	@DisplayName("Test2: select")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void select() {
		log.trace("select() invoked. ");
		
		GoodsVO goods = this.mapper.select(77);
		assertNotNull(goods);
		
		log.trace("goods: {}", goods);
		
		
	}
	
=======
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("Test3: selectTotalCount")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectTotalCount() {
		log.trace("selectTotalCount() invoked.");
		
//		String keyword = "product_1";
		String keyword = null;
		
		Integer totalCount = this.mapper.selectTotalCount(keyword);
		
		log.info("\t+ totalCount: {}", totalCount);
		
	} //selectTotalCount
	
//	@Disabled
	@Test
	@Order(4)
	@DisplayName("Test3: selectSearch")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void selectSearch() {
		log.trace("selectSearch() invoked.");
		
		GoodsCriteria cri = new GoodsCriteria();
		cri.setCurrPage(1);
		cri.setAmount(20);
		cri.setKeyword("product_1");
//		cri.setSort("popular");
//		cri.setSort("low");
		cri.setSort("high");
		
		List<GoodsVO> list = this.mapper.selectSearch(cri);
		assertNotNull(list);
		
		list.forEach(log::info);	
		
	} //selectSearch

} //end class







