package org.zerock.wecart.service.pricecompare;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.wecart.domain.pricecompare.TodayCartGoodsVO;
import org.zerock.wecart.domain.pricecompare.TodayCartPriceVO;
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
	
	//1. 상세 장바구니 상품 정보
	@Override
	public List<TodayCartGoodsVO> getGoods(Integer cart_id) throws ServiceException {
		log.trace("getGoods({}) invoked.", cart_id);
		
		try {
			return this.mapper.selectGoods(cart_id);
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	}

	//2. 상세 장바구니 마트별 가격 정보
	@Override
	public List<TodayCartPriceVO> getPrices(Integer goods_id, Date api_date, Integer member_id)
			throws ServiceException {
		log.trace("getGoods({}, {}, {}) invoked.", goods_id, api_date, member_id);
		
		try {
			List<TodayCartPriceVO> list = this.mapper.selectPrices(goods_id, api_date, member_id);

			List<TodayCartPriceVO> modifiedList = list.stream()
				    .map(item -> {
				        if (item.getGoods_id() == null) {
				            item.setGoods_id(goods_id);
				        } //if
				        if (item.getAvg_price() == null) {
				            item.setAvg_price(this.mapper.selectAvgPrice(goods_id, api_date));
				        } //if
				        return item;
				    })
				    .collect(Collectors.toList());			
			
			return modifiedList;
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	} //getGoods

	@Override
	public int removeCart(Integer cart_id) throws ServiceException {
		try {
			return this.mapper.deleteCart(cart_id);
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	} //removeCart

	@Override
	public String getCreationDate(Integer cart_id) throws ServiceException {
		try {
			Date date = this.mapper.selectCreationDate(cart_id);

			SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = fomatter.format(date);
			
			return formattedDate;
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	} //getCreationDate
} //end class





