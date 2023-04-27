package org.zerock.wecart.service.user;

import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ServiceException;

public interface UserService {
	
	// 로그인
	public abstract UserVO login(LoginDTO dto) throws ServiceException;
	
	// 아이디 찾기
	public abstract String searchId(UserDTO dto) throws ServiceException;
	
	// 비밀번호 찾기
	public abstract Boolean searchPw(UserDTO dto) throws ServiceException;
	
	// 회원가입
	public abstract Boolean signUp(UserDTO dto) throws ServiceException;

} // end interface

