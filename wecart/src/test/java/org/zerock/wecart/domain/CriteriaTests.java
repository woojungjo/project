package org.zerock.wecart.domain;

import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.Timeout;
import org.zerock.wecart.domain.board.Criteria;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CriteriaTests {
	
	@BeforeAll
	void beforeAll() { //1회성 전처리, 가장 중요한 자원을 1회성으로 얻어서 계속 사용 
		//보통 필드에서 주입받은 것을 넣고 검증 
		log.trace("beforeAll()");
	}//beforeAll()
	
	@AfterAll
	void afterAll() {//1회성 후처리 
		log.trace("afterAll()");
	}//afterAll
	
	@BeforeEach
	void beforeEach() { //단위 테스트 메소드 수행시마다 전처리 수행 
		log.trace("beforeEach()");
	}//beforeEach
	
	@AfterEach
	void afterEach() { //단위 테스트 메소드 수행시마다 후처리 수행
		log.trace("AfterEach()");
	}//afterEach();
	
//	@Disabled
	@Test
	@DisplayName("contextloads")
	@Order(1)
	@Timeout(value=1, unit=TimeUnit.SECONDS)
	void contextloads() {
		log.trace("contextloads() invoked.");
		
		Criteria cri = new Criteria();
		cri.setCurrPage(3);
//		cri.setAmount(20);
//		cri.setPagesPerPage(10);
		cri.setSort("177");
		
		//검색 기능이 추가될 경우 설정 
//		cri.setType("ju"); // 검색 기능 타입
		cri.setKeyword("대한민국");
		
		//다국어 문자 지원 
		String queryString = cri.getPagingUri();
		log.trace("\t+queryString:{}",queryString );
		
	}//contextloads()
	
}//CriteriaTests
