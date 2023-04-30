package org.zerock.wecart.service.mypage.edit;

import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ServiceException;

public interface EditService {

	// 비밀번호 확인
	public abstract UserVO checkPw(UserDTO dto) throws ServiceException;

	// 닉네임 변경
	public abstract Boolean changeAli(UserDTO dto) throws ServiceException;

	// 비밀번호 변경
	public abstract Boolean changePw(UserDTO dto) throws ServiceException;

	// 이메일 변경
	public abstract Boolean changeEmail(UserDTO dto) throws ServiceException;

	// 휴대전화 인증
//	public abstract UserVO authMobileNum(UserDTO dto) throws ServiceException;

	// 회원 탈퇴
	public abstract Boolean withdrawal(Integer member_id) throws ServiceException;

} // end interface
