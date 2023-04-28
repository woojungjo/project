package org.zerock.wecart.service.pricecompare;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.TodayCartMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class TodayCartServiceImpl implements TodayCartService {
	
	private TodayCartMapper mapper;
	
	@Autowired
	public TodayCartServiceImpl(TodayCartMapper mapper) {
		this.mapper = mapper;
	} //Constructor
	
	@Override
	public List<TodayCartGoodsVO> getGoods(Integer member_id) throws ServiceException{
		log.trace("getGoods() invoked.");
		
		try {			
			return this.mapper.selectGoods(member_id);
		} catch(Exception e) {
			throw new ServiceException(e);
		}
	} //getGoods

	@Override
	public List<TodayCartPriceVO> getPrices(Integer goods_id, Integer member_id) throws ServiceException{
		log.trace("getPrices() invoked.");
		
		try {
			List<TodayCartPriceVO> list = this.mapper.selectPrices(goods_id, member_id);

			List<TodayCartPriceVO> modifiedList = list.stream()
				    .map(item -> {
				        if (item.getGoods_id() == null) {
				            item.setGoods_id(goods_id);
				        } //if
				        if (item.getAvg_price() == null) {
				            item.setAvg_price(this.mapper.selectAvgPrice(goods_id));
				        } //if
				        return item;
				    })
				    .collect(Collectors.toList());			
			
			return modifiedList;
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	}

	@Transactional
	@Override
	public int remove(Integer goods_id, Integer member_id) throws ServiceException {
		try {
			return this.mapper.delete(goods_id, member_id);
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch		
	} //getPrices

} //end class