package org.zerock.wecart.controller.board.mateBoard;

import static org.junit.jupiter.api.Assertions.assertNotNull;

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
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import lombok.Cleanup;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {
		"file:src/main/webapp/**/spring/root-*.xml",
		"file:src/main/webapp/**/spring/**/servlet-*.xml"
		}
		)
//Spring MVC 까지 작동(=>결과적으로 Spring core인, 
//Spring Beans Container까지 생성함) 시키는 어노테이션으로,
//표현계층의 컨트롤러 핸들러메소드 테스트 할때에
//반드시넣어주여야 하는 어노테이션******
@WebAppConfiguration //spring MVC 작동 

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class MateBoardControllerTests {

//	다른 계층과는 다르게 빈 주입하기 위해서 아래와 같은 방법 사용 
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx; //Spring beans container 의 구현객체 
	
	@BeforeAll //전처리 작업 
	void beforeAll() { //1회성 전처리 수행 
		log.trace("beforeAll() invoked.");
		
		//의존성 주입 (DI) 확인
		assertNotNull("this.ctx");

		log.info("\t+this.ctx:{}", this.ctx);
	}//beforeAll()
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("testMateList")
	@Timeout(value=10, unit=TimeUnit.SECONDS)
	void testMateList() throws Exception{
		log.trace("testMateList() invoked");
		
		//MockMvc를 지어줄 "건설사(Builder)"부터 획득
		DefaultMockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		//MateBoardControoler의 /board/mate/matelist,Get handler 테스트
		//상위타입인 requestBuilder를 타입으로 가짐
		RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/mate/matelist");
		
		//가상의 MVC 환경에서, MateBoardController에 요청생성 및 전송
		@Cleanup("clear")
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		log.info("\t+modelAndView:{}, type:{}, model:{}", modelAndView.getViewName(), modelAndView.getClass().getName(), modelAndView.getModel());

	}//testMateList() 
	
}//MateBoardControllerTests
