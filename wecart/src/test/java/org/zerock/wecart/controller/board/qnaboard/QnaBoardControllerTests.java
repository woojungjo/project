package org.zerock.wecart.controller.board.qnaboard;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.concurrent.TimeUnit;

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
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.wecart.domain.board.QnaBoardVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class QnaBoardControllerTests {

	@Setter(onMethod_=@Autowired )
	private WebApplicationContext ctx;
	
	@Test
	@Order(1)
	@DisplayName("testList")
	@Timeout(value = 1, unit = TimeUnit.SECONDS)
	void testList() throws Exception {
		log.trace("testList() invoked.");
		
		// MockMvc를 지어줄 "건설사(Builder)"부터 획득
		MockMvcBuilder mockMvcBuilder =  MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		// BoardController의 /board/list, GET 핸들러 테스트
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/qna/list");
		requestBuilder.param("currPage", "3");
		
		// 이제 가상의 MVC 환경에서, BoardController에 요청생성 및 전송
//		@Cleanup("clear")
//		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
//		log.info("\t+ viewName: {}", modelAndView);
		
		mockMvc.perform(requestBuilder);
		
		
		// 테스트 대상 컨트롤러 핸들러(메소드)가 반환한, (1) 모델 (2) 뷰이름 중에,
		// 모델(ModelMap)을 얻었으니, 순회하여 그 안의 모든 모델속성(즉, 비지니스 데이터인 모델객체들)
		// 출력
//		ModelMap modelMap = mockMvc.perform(requestBuilder).andReturn().getModelAndView().getModelMap();
//		log.info("\t+ modelMap: {}", modelMap);
		
		
	} // testList
	
	@Test
	@Order(2)
	@DisplayName("testRegister()")
	@Timeout(value=3, unit=TimeUnit.SECONDS)
	void testRegister() throws Exception {
		log.trace("testRegister() invoked.");
		
		DefaultMockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/board/register");
		
		requestBuilder.param("post_no", "3333333");
		requestBuilder.param("member_id", "333");
		requestBuilder.param("views", "100000");
		requestBuilder.param("secret_yn", "1");
		requestBuilder.param("title", "******test*******"); 
		requestBuilder.param("content", "*******test*******");
		
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		log.info("\t+modelAndView:{}, type:{}", modelAndView.getViewName(),modelAndView.getClass().getName());

	}//testRegister()
	
	@Test
	@Order(3)
	@DisplayName("testModify")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testModify() throws Exception {
		log.trace("testModify() invoked.");
		
		DefaultMockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		//Step.1 post_no 333 게시글 상세히 조회 
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/qna/read/{post_no}", 333);
		
		//가상의 MVC 환경에서 MateBoardController요청생성 및 전송 
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		log.info("modelAndView: {}", modelAndView);
		log.info("\t+viewName:{}, type:{}", modelAndView.getViewName(),modelAndView.getClass().getName());

		ModelMap model = modelAndView.getModelMap();
		log.info("\t+model:{}, type:{}", model, model.getClass().getName());
		
		QnaBoardVO vo = (QnaBoardVO) model.getAttribute("readVO");
		
		assertNotNull(vo);
		log.info("vo:{}", vo);
		
		//Step.2 333 게시글 수정 
		Integer post_no = vo.getPost_no();
//		String title = vo.getTitle();
//		String content = vo.getContent();
//		Integer member_id = vo.getMember_id();
//		Integer secret_yn= vo.getSecret_yn();
		Integer views = vo.getViews();
		
		requestBuilder = MockMvcRequestBuilders.post("/board/qna/modify");
		requestBuilder.param("post_no", post_no.toString());
		requestBuilder.param("title", "TEST_UPDATE_CONTROLLER");
		requestBuilder.param("content", "TEST_UPDATE_CONTROLLER");	
		requestBuilder.param("secret_yn", "0");
		requestBuilder.param("views", views.toString());
				    
		//가상의 MVC 환경에서, BoardController에 요청생성 및 전송
		modelAndView = 
				mockMvc.
					perform(requestBuilder).
					andReturn().
					getModelAndView();
	}//testModify()
	
	
	
} // end class
