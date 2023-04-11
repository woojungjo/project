package org.zerock.wecart.mapper.user;

import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;

public interface UserMapper {
	
	// 로그인
	public abstract UserVO selectUser(LoginDTO dto);

} // end interface
