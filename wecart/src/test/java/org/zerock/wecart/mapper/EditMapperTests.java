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
import org.zerock.wecart.mapper.mypage.edit.EditMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-**.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class EditMapperTests {
	
	@Autowired
	private EditMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
	} // beforeAll
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("updateAliTest")
	@Timeout(value=5, unit = TimeUnit.SECONDS)
	void updateAliTest() {
		log.trace("updateAliTest() invoked.");
		
		String login_id = "loginid1";
		
		// 닉네임 변경
		String alias = "aliTest";
//		String alias = "ali1";
		
		// 인스턴스 생성
		UserDTO dto = new UserDTO();
		
		dto.setLogin_id(login_id);
		dto.setAlias(alias);
		
		log.info("\t dto:{}", dto);

		assertNotNull(dto);
		
		this.mapper.updateAli(dto);
	} // updateAliTest
	
	@Test
	@Order(2)
	@DisplayName("deleteUserTest")
	@Timeout(value=5, unit = TimeUnit.SECONDS)
	void deleteUserTest() {
		log.trace("deleteUserTest() invoked.");
		
//		UserVO vo = null;
		
//		Integer member_id = vo.getMember_id();
		
		Integer member_id = 2061343;
		
		int affectedLines = this.mapper.deleteUser(member_id);
		
		log.info("\t+ affectedLines: {}",  affectedLines);
		
	} // deleteUserTest
	
	
} // end class
