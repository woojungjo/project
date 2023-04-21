package org.zerock.wecart.mapper;

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
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.mapper.user.UserMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-**.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserTests {
	
	@Autowired
	private UserMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
	} // beforeAll
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("updatePwTest")
	@Timeout(value=1, unit = TimeUnit.MINUTES)
	void updatePwTest() {
		log.trace("updatePwTest() invoked.");

		String login_id = "loginid1";		
		String alias = "ali1";
		String email = "email_1@.com";
		
		
		// 비밀번호 변경
		String pwd = "temp_pwd1";
		
		UserDTO dto = new UserDTO();
		
		dto.setLogin_id(login_id);
		dto.setAlias(alias);
		dto.setEmail(email);
		dto.setPwd(pwd);
		
		log.info("\t dto:{}", dto);

		assertNotNull(dto);
		
		this.mapper.updatePw(dto);
	} // updatePwTest
} // end class
