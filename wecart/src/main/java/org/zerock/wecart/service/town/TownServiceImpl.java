package org.zerock.wecart.service.town;

import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.town.TownMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@ToString
@Log4j2
@NoArgsConstructor

@Service("townService")
public class TownServiceImpl implements TownService, InitializingBean {

	@Setter(onMethod_= {@Autowired})
	private TownMapper mapper;
	
	//빈, 주입잘 받았는지 체크 필요. 
	@Override
	public void afterPropertiesSet() throws Exception {
		log.trace("afterPropertiesSet() invoked");
		
		try {
			Objects.requireNonNull(this.mapper);//ServiceException으로 매핑해서 던지도록 
		}catch(Exception e) {
			throw new ServiceException(e);
		}//try-catch
	}//afterPropertiesSet() 
	
	@Override
	public boolean update(String townName, String loginId) throws ServiceException {
		log.trace("update({}, {}) invoked.", townName, loginId);
		
		try {
			return this.mapper.updateTownName(townName, loginId)==1;
		}catch(Exception e) {
			throw new ServiceException(e);
		}//try-catch
		
	}//update

}//TownServiceImpl
