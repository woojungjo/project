package org.zerock.wecart.service.mypage.edit;

import org.springframework.stereotype.Service;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.domain.user.UserDTO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.mypage.edit.EditMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class EditServiceImpl implements EditService {

	private EditMapper mapper;
	
	@Override
	public UserVO checkUser(LoginDTO dto) throws ServiceException {
		log.trace("checkPw() invoked.");
		
		try {
			return this.mapper.selectUser(dto);
		} catch (Exception e) {
			throw new ServiceException(e);
		} // try - catch
	} // checkPw

	@Override
	public Boolean changeAli(UserDTO dto) throws ServiceException {
		log.trace("changeAli() invoked.");
		
		try {
			return this.mapper.updateAli(dto) == 1;
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // changeAli

	@Override
	public Boolean changePw(UserDTO dto) throws ServiceException {
		log.trace("changePw() invoked.");
		
		try {
			return this.mapper.updatePw2(dto) == 1;
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // changePw

	@Override
	public Boolean changeEmail(UserDTO dto) throws ServiceException {
		log.trace("changeEmail() invoked.");
		
		try {
			return this.mapper.updateEmail(dto) == 1;
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // changeEmail

	@Override
	public Boolean withdrawal(Integer member_id) throws ServiceException {
		log.trace("withdraw() invoked.");
		
		try {
			return this.mapper.deleteUser(member_id) == 1;
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // withdraw

} // end class
