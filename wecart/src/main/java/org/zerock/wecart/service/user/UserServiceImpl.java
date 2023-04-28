package org.zerock.wecart.service.user;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.user.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class UserServiceImpl implements UserService {

	private UserMapper mapper;

	private JavaMailSender mailSender;

	@Override
	public UserVO login(LoginDTO dto) throws ServiceException {
		log.trace("login() invoked.");

		try {
			return this.mapper.selectUser(dto);
		} catch (Exception e) {
			throw new ServiceException(e);
		} // try - catch
	} // login

	@Override
	public String searchId(UserDTO dto) throws ServiceException {
		log.trace("searchId({}) invoked.", dto);

		try {
			return this.mapper.selectId(dto);
		} catch (Exception e) {
			throw new ServiceException(e);
		} // try - catch
	} // searchId

	// 임시 비밀번호 생성 메소드
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

	@Override
	public Boolean searchPw(UserDTO dto) throws ServiceException {

		String login_id = dto.getLogin_id();
		String email = dto.getEmail();

		// 임시 비밀번호 생성
		String temp_pwd = getTempPassword();

		// 생성한 임시비밀번호로 변경
		dto.setPwd(temp_pwd);

		// 비밀번호 암호화해주는 메서드
//				pwd = UserSha256.encrypt(pwd);

		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '" + login_id + "' 님</h2><br><br>" + "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + temp_pwd
				+ "'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost:8080/'>우리동네 장바구니 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[우리동네 장바구니] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		} // try-catch

		try {
			return this.mapper.updatePw(dto) == 1;
		} catch (Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // searchPw
	
	@Override
	public Boolean signUp(UserDTO dto) throws ServiceException {
		log.trace("signUp() invoked.");
		
		try {
			return this.mapper.insertUser(dto) == 1;
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // signUp

} // end class
