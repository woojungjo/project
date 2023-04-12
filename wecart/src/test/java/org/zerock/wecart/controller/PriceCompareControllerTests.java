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
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import lombok.Cleanup;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/**/root-*.xml",
								  "file:src/main/webapp/**/spring/**/servlet-*.xml"})

@WebAppConfiguration

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class PriceCompareControllerTests {

	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		Objects.requireNonNull(ctx);
		log.info("\t+ this.ctx: {}", ctx);
	} //beforeAll

//	@Disabled
	@Test
	@Order(1)
	@DisplayName("TEST1: list")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void list() throws Exception {
		log.trace("list() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder requestBuilder =	MockMvcRequestBuilders.get("/priceCompare/list"); 
		requestBuilder.param("currPage", "11");
		requestBuilder.param("amount", "40");
		
		@Cleanup("clear")
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		
		log.info("\t+ viewName: {}", modelAndView.getViewName());
		log.info("\t+ model: {}", modelAndView.getModel());		
	} //list
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("TEST2: search")
	@Timeout(value=4, unit=TimeUnit.SECONDS)
	void search() throws Exception {
		log.trace("search() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder requestBuilder =	MockMvcRequestBuilders.get("/priceCompare/search"); 
		requestBuilder.param("currPage", "1");
		requestBuilder.param("amount", "40");
		requestBuilder.param("keyword", "product_1");
		
		@Cleanup("clear")
		ModelAndView modelAndView = mockMvc.perform(requestBuilder).andReturn().getModelAndView();
		
		log.info("\t+ viewName: {}", modelAndView.getViewName());
		log.info("\t+ model: {}", modelAndView.getModel());		
	} //search
} //end class














