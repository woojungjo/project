package org.zerock.wecart.mapper.user;

import org.apache.ibatis.annotations.Param;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;

public interface UserMapper {
	
	// 로그인
	public abstract UserVO selectUser(LoginDTO dto);
	
	// 아이디 찾기
	public abstract String selectID(@Param("alias") String alias, @Param("email") String email);

} // end interface
