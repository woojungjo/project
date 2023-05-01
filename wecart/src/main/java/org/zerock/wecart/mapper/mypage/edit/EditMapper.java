package org.zerock.wecart.mapper.mypage.edit;

import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.UserDTO;

public interface EditMapper {
	
	// 유저 재확인
	public abstract UserVO selectUser(LoginDTO dto);
	
	// 닉네임 변경
	public abstract Integer updateAli(UserDTO dto);
	
	// 비밀번호 변경
	public abstract Integer updatePw2(UserDTO dto);
	
	// 이메일 변경
	public abstract Integer updateEmail(UserDTO dto);
	
	// 휴대전화 인증
//	public abstract UserVO selectMobile(UserDTO dto);
	
	// 회원 탈퇴
	public abstract Integer deleteUser(Integer member_id);

} // end interface
