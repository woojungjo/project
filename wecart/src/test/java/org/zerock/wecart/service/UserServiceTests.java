package org.zerock.wecart.service;

import java.util.Random;
import java.util.concurrent.TimeUnit;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.service.user.UserService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-**.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserServiceTests {

	@Autowired
	private UserService service;

	@Autowired
	private JavaMailSender mailSender;

	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
	} // beforeAll
	
	public String getTempPassword() {
		String temp = "abcdefghijklmnopqrstuvwxyz0123456789";
		int length = 8;
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < length; i++) {
			int index = random.nextInt(temp.length());
			sb.append(temp.charAt(index));
		}
		return sb.toString();
	} // getTempPassword

//	@Disabled
	@Test
	@Order(1)
	@DisplayName("searchPwTest")
	@Timeout(value = 1, unit = TimeUnit.MINUTES)
	void searchPwTest() throws ServiceException {
		log.trace("searchPwTest() invoked.");
		
		// 로그인 DTO 설정
		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setLogin_id("loginid1");
		loginDTO.setPwd("w7d8mld4");
		
		// UserVO 에서 값 불러오기
		UserVO vo = this.service.login(loginDTO);
		log.info("1. ********************************* UserVO: {}", vo);
		
		// UserDTO에 불러온 값 설정
		UserDTO dto = new UserDTO();
		dto.setLogin_id(vo.getLogin_id());
		dto.setPwd(vo.getPwd());
		dto.setEmail(vo.getEmail());
		dto.setAlias(vo.getAlias());
		log.info("2. ********************************* dto: {}", dto);

		// 메일 발송할때 쓸 변수 설정
		String login_id = dto.getLogin_id();
		String email = dto.getEmail();

		// 임시 비밀번호 생성
		String temp_pwd = getTempPassword();
		
		// 생성한 임시비밀번호로 변경
		dto.setPwd(temp_pwd);

		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '" + login_id + "' 님</h2><br><br>" + "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + temp_pwd
				+ "'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost:8080/'>우리동네 장바구니 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";

		try {
			mail.setSubject("[우리동네 장바구니] 임시 비밀번호가 발급되었습니다", "utf-8"); // 제목
			mail.setText(htmlStr, "utf-8", "html"); // 메일 설정
			mail.addRecipient(RecipientType.TO, new InternetAddress(email)); // RecipientType(메일받는 유형 설정) TO(수신자), CC(참조), BCC(숨은참조)
																			 // InternetAddress(수신자의 메일주소)
			mailSender.send(mail); // 메일 전송
			
			this.service.searchPw(dto);
		} catch(MessagingException e) {
			e.printStackTrace();
		} // try-catch
	} // searchPwTest
} // end class
