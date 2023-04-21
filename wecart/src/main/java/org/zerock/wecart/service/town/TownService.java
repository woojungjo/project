package org.zerock.wecart.service.town;

import org.zerock.wecart.exception.ServiceException;

public interface TownService {

//	townName update (UPDATE)
	public abstract boolean update(String townName, String loginId) throws ServiceException;
}//Town Service interface 
