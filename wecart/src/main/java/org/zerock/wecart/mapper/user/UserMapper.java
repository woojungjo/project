package org.zerock.wecart.mapper.user;

import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.SignUpDTO;
import org.zerock.wecart.domain.user.UserDTO;

public interface UserMapper {
	
	// 로그인
	public abstract UserVO selectUser(LoginDTO dto);
	
	// 아이디 찾기
	public abstract String selectId(UserDTO dto);
	
	// 비밀번호 찾기
	public abstract Integer updatePw(UserDTO dto);
	
	// 회원가입
	public abstract Integer insertUser(SignUpDTO dto);

} // end interface
