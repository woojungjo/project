package org.zerock.wecart.persistence;

import java.util.Date;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
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
import org.zerock.wecart.mapper.TimeMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

// Spring Framework 을 함께 구동시킴
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/root-*.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TimeMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private SqlSessionFactory sqlSessionFactory;
	
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assert this.sqlSessionFactory != null;
		log.info("\t+ this.sqlSessionFactory: {}", this.sqlSessionFactory);
	} // beforeAll
	
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("testGetNow")
	@Timeout(value=1, unit=TimeUnit.SECONDS)
	void testGetNow() {
		log.trace("testGetNow() invoked.");

		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		
		TimeMapper mapper = sqlSession.getMapper(TimeMapper.class);
		Objects.requireNonNull(mapper);
		log.info("\t+ mapper: {}, type: {}", mapper, mapper.getClass().getName());
		
		Date now = mapper.getNow();
		log.info("\t+ now: {}", now);
	} // testGetNow
	
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("testGetNow2")
	@Timeout(value=1, unit=TimeUnit.SECONDS)
	void testGetNow2() {
		log.trace("testGetNow2() invoked.");

		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		
		TimeMapper mapper = sqlSession.getMapper(TimeMapper.class);
		Objects.requireNonNull(mapper);
		log.info("\t+ mapper: {}, type: {}", mapper, mapper.getClass().getName());
		
		Date now = mapper.getNow2();
		log.info("\t+ now: {}", now);
	} // testGetNow2
	
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("testGetNowByDynamicMapperInterface")
	@Timeout(value=1, unit=TimeUnit.SECONDS)
	void testGetNowByDynamicMapperInterface() {	// 마이바티스의 설정파일을 등록하지 않았을 때에도, 
							// Mapper 인터페이스를 동적으로 Mapper Registry 등록해서 사용하는 법 
		log.trace("testGetNowByDynamicMapperInterface() invoked.");

		// Step.1 동적으로 TimeMapper 인터페이스를, Mapper Registry에 등록
		Configuration conf = this.sqlSessionFactory.getConfiguration();
		conf.addMapper(TimeMapper.class);			// Mapper Interface 동적등록
		
		// Step.2 TimeMapper 인터페이스에 대한, MapperProxy객체를 얻어서, 메소드 호출
		SqlSession sqlSession = this.sqlSessionFactory.openSession();		
		TimeMapper mapper = sqlSession.getMapper(TimeMapper.class);
		
		Objects.requireNonNull(mapper);
		log.info("\t+ mapper: {}, type: {}", mapper, mapper.getClass().getName());
		
		Date now = mapper.getNow();
		log.info("\t+ now: {}", now);
	} // testGetNowByDynamicMapperInterface

} // end class
