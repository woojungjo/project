package org.zerock.wecart.service.user;

import org.springframework.stereotype.Service;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.domain.user.LoginDTO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.user.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class UserServiceImpl implements UserService {
	
	private UserMapper mapper;

	@Override
	public UserVO login(LoginDTO dto) throws ServiceException {
		log.trace("login() invoked.");
		
		try {
			return this.mapper.selectUser(dto);
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
		
	} // login

} // end class
