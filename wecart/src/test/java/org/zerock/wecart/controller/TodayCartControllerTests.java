package org.zerock.wecart.controller;

import java.util.Objects;
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
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.pricecompare.CartUserDTO;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.service.pricecompare.PriceCompareService;
import org.zerock.wecart.service.pricecompare.TodayCartService;
import org.zerock.wecart.service.user.UserService;

import lombok.Cleanup;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-*.xml",
		"file:src/main/webapp/**/spring/**/servlet-*.xml" })

@WebAppConfiguration

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TodayCartControllerTests {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;

	@Setter(onMethod_= {@Autowired})
	PriceCompareService priceCompareService;
	
	@Setter(onMethod_= {@Autowired})
	UserService userService;
	
	@Setter(onMethod_= {@Autowired})
	TodayCartService todayCartService;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked. ");
		
		
		Objects.requireNonNull(ctx);
		log.info("\t+ this.ctx: {}", this.ctx);
		
		Objects.requireNonNull(priceCompareService);
		log.info("\t+ this.priceCompareService: {}", this.priceCompareService);
		
		Objects.requireNonNull(todayCartService);
		log.info("\t+ this.todayCartService: {}", this.todayCartService);
		
	} // beforAll
	
	
//	@Disable
	@Test
	@Order(1)
	@DisplayName("TEST1: register")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	GoodsVO register(Model model) throws Exception {
		log.trace("register({}) invoked. ");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		MockHttpServletRequestBuilder requestBuilder =	MockMvcRequestBuilders.post("/todayCart/register");
		
		
		MockHttpSession session = new MockHttpSession();
		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setLogin_id("loginid1");
		loginDTO.setPwd("PWD1");
		UserVO userVO = this.userService.login(loginDTO);
		
		
		session.setAttribute("__AUTH__", userVO);
		requestBuilder.session(session);
		
		@Cleanup("clear")
		ModelAndView nodel = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		
		
		Integer goods_id = (Integer) model.getAttribute("goods_id");
		log.trace("goods_id: {}", goods_id);
		GoodsVO goodsVO = (GoodsVO) priceCompareService.select(goods_id);
		log.trace("goodVO: {}", goodsVO);
		UserVO userVOAtController = (UserVO) model.getAttribute("__AUTH__");
		log.trace("UserVO: {}", userVOAtController);

		return goodsVO;
	}
	
//	@Disable
	@Test
	@Order(2)
	@DisplayName("TEST2: cartList")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void cartList() throws Exception {
		log.trace("cartList() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
//		
//		MockHttpSession session = new MockHttpSession();
//		LoginDTO loginDTO = new LoginDTO();
//		loginDTO.setLogin_id("loginid10");
//		loginDTO.setPwd("PWD10");
//		UserVO userVO = this.userService.login(loginDTO);
//		
//		MockHttpServletRequestBuilder requestBuilder =	MockMvcRequestBuilders.get("/todayCart/cartList"); 
//		requestBuilder.param("member_id", "207");
//		
//		@Cleanup("clear")
//		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
//		
//		Objects.requireNonNull(modelAndView);
//		log.info("\t+ viewName: {}", modelAndView.getViewName());
//		log.info("\t+ model: {}", modelAndView.getModel());		
		
		// 세션에 저장될 CartUserDTO 객체 생성
        CartUserDTO cartUserDTO = new CartUserDTO();
        cartUserDTO.setMember_id("207"); // 원하는 멤버 아이디 값으로 설정
        
        // 세션에 CartUserDTO 객체를 저장하기 위한 MockHttpSession 객체 생성
        MockHttpSession session = new MockHttpSession();
        session.setAttribute("__AUTH__", cartUserDTO);
        
        // MockMvc를 사용하여 GET /todayCart/cartList 요청을 전송하고 응답을 검증
        mockMvc.perform(MockMvcRequestBuilders.get("/todayCart/cartList")
                .session(session)) // 생성한 MockHttpSession 객체를 세션으로 설정
                .andExpect(MockMvcResultMatchers.status().isOk()) // HTTP 상태 코드 200인지 검증
//                .andExpect(MockMvcResultMatchers.view().name("cartList")) // View의 이름이 "cartList"인지 검증
                .andExpect(MockMvcResultMatchers.model().attributeExists("__GOODSLIST__")) // 모델에 "__GOODSLIST__" 속성이 존재하는지 검증
                .andExpect(MockMvcResultMatchers.model().attributeExists("__PRICELIST__")); // 모델에 "__PRICELIST__" 속성이 존재하는지 검증	
	}	//cartList
} //end class

















