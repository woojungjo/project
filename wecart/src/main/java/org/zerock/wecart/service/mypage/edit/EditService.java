package org.zerock.wecart.service.mypage.edit;

import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ServiceException;

public interface EditService {

	// 유저 재확인
	public abstract UserVO checkUser(LoginDTO dto) throws ServiceException;

	// 닉네임, 이메일 변경
	public abstract Boolean changeUser(UserDTO dto) throws ServiceException;

	// 비밀번호 변경
	public abstract Boolean changePw(UserDTO dto) throws ServiceException;

	// 휴대전화 인증
//	public abstract UserVO authMobileNum(UserDTO dto) throws ServiceException;

	// 회원 탈퇴
	public abstract Boolean withdrawal(Integer member_id) throws ServiceException;

} // end interface
