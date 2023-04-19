package org.zerock.wecart.controller.board.mateBoard;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Timestamp;
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
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.wecart.domain.mateboard.MateBoardVO;

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
	@Timeout(value=50, unit=TimeUnit.SECONDS)
	void testMateList() throws Exception{
		log.trace("testMateList() invoked");
		
		//MockMvc를 지어줄 "건설사(Builder)"부터 획득
		DefaultMockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		//MateBoardControoler의 /board/mate/matelist,Get handler 테스트
		//상위타입인 requestBuilder를 타입으로 가짐
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/mate/matelist");
		requestBuilder.param("currPage","2");
		requestBuilder.param("amount","20");
		
		//가상의 MVC 환경에서, MateBoardController에 요청생성 및 전송
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		log.info("\t+modelAndView:{}, type:{}, model:{}", modelAndView.getViewName(), modelAndView.getClass().getName(), modelAndView.getModel());

	}//testMateList() 
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("testGet")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testGet() throws Exception {
		log.trace("testGet() invoked.");

		DefaultMockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/mate/mateget/{post_no}", 166);
		
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		log.info("\t+viewName:{}, type:{}", modelAndView.getViewName(),modelAndView.getClass().getName());

	}//testGet()
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("testModify")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testModify() throws Exception {
		log.trace("testModify() invoked.");
		
		DefaultMockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		//Step.1 post_no 305게시글 상세히 조회 
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/mate/mateget/{post_no}", 305);
		
		//가상의 MVC 환경에서 BoardController요청생성 및 전송 
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		log.info("modelAndView: {}", modelAndView);
		
		log.info("\t+viewName:{}, type:{}", modelAndView.getViewName(),modelAndView.getClass().getName());

		ModelMap model = modelAndView.getModelMap();
		log.info("\t+model:{}, type:{}", model, model.getClass().getName());
		
		MateBoardVO vo = (MateBoardVO) model.getAttribute("__MateBoard__");
		
		assertNotNull(vo);
		log.info("vo:{}", vo);
		
		//Step.2 305 게시글 수정 
		Integer post_no = vo.getPost_no();
		Integer member_id = vo.getMember_id();
		Integer views = vo.getViews();
		Character meeting_status = vo.getMeeting_status();
		String meeting_area = vo.getMeeting_area();
//		Integer participant_id1 = vo.getParticipant_id_1();
//		Integer participant_id2 = vo.getParticipant_id_2();
//		Integer participant_id3 = vo.getParticipant_id_3();
		
		requestBuilder = MockMvcRequestBuilders.post("/board/mate/matemodify");
		requestBuilder.param("post_no", post_no.toString());
		requestBuilder.param("member_id", member_id.toString());
		requestBuilder.param("views", views.toString());
		requestBuilder.param("meeting_status", meeting_status.toString());
		requestBuilder.param("meeting_area", meeting_area.toString());
//		requestBuilder.param("participant_id1", participant_id1.toString());
//		requestBuilder.param("participant_id2", participant_id2.toString());
//		requestBuilder.param("participant_id3", participant_id3.toString());
		requestBuilder.param("title", "*******수정*******"); //수정항목1
		requestBuilder.param("content", "*******수정*******"); //수정항목2
		
		//가상의 MVC 환경에서, BoardController에 요청생성 및 전송
		modelAndView = 
				mockMvc.
					perform(requestBuilder).
					andReturn().
					getModelAndView();
	}//testModify()
	
	//@Disabled
	@Test
	@Order(4)
	@DisplayName("testRegister()")
	@Timeout(value=3, unit=TimeUnit.SECONDS)
	void testRegister() throws Exception {
		log.trace("testRegister() invoked.");
		
		DefaultMockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/board/register");
		
		Timestamp now = new Timestamp(System.currentTimeMillis());

		requestBuilder.param("post_no", "100000001");
		requestBuilder.param("member_id", "333");
		requestBuilder.param("views", "100000");
		requestBuilder.param("meeting_status", "0");
		requestBuilder.param("meeting_area", "NY");
		requestBuilder.param("meeting_time", now.toString());
		requestBuilder.param("report_cnt", "0");
		requestBuilder.param("participant_id_1", "335");
		requestBuilder.param("participant_id_2", "337");
		requestBuilder.param("participant_id_3", "339");
		requestBuilder.param("title", "******JU NEW*******"); 
		requestBuilder.param("content", "*******JU NEW*******");
		
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		log.info("\t+modelAndView:{}, type:{}", modelAndView.getViewName(),modelAndView.getClass().getName());

	}//testRegister()
	
}//MateBoardControllerTests
