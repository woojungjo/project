package org.zerock.wecart.service.user;

import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.exception.ServiceException;

public interface UserService {
	
	// 로그인
	public abstract UserVO login(LoginDTO dto) throws ServiceException;

} // end interface

