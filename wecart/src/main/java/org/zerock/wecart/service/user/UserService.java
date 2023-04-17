package org.zerock.wecart.service.user;

import org.apache.ibatis.annotations.Param;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.exception.ServiceException;

public interface UserService {
	
	// 로그인
	public abstract UserVO login(LoginDTO dto) throws ServiceException;
	
	// 아이디 찾기
	public abstract String searchId(@Param("alias") String alias, @Param("email") String email) throws ServiceException;
	
	// 비밀번호 찾기
	public abstract String searchPw(@Param("user_id") String user_id, @Param("alias") String alias, @Param("email") String email) throws ServiceException;

} // end interface

