package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.DetailMyPageCartMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class DetailMyPageCartServiceImpl implements DetailMyPageCartService {
	
	private DetailMyPageCartMapper mapper;
	
	@Autowired
	public DetailMyPageCartServiceImpl(DetailMyPageCartMapper mapper) {
		this.mapper = mapper;
	} //Constructor
	
	@Override
	public List<TodayCartGoodsVO> getGoods(Integer cart_id) throws ServiceException {
		log.trace("getGoods({}) invoked.", cart_id);
		
		try {
			return this.mapper.selectGoods(cart_id);
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	} //getGoods

} //end class
