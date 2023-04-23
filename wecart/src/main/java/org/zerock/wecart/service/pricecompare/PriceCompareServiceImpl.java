package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.GooodsMapper;
import org.zerock.wecart.mapper.pricecompare.PriceCompareMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class PriceCompareServiceImpl implements PriceCompareService {

	private PriceCompareMapper priceCompareMapper;
	private GooodsMapper gooodsMapper;
	
	@Autowired
	public PriceCompareServiceImpl(PriceCompareMapper priceCompareMapper, GooodsMapper gooodsMapper) {
		this.priceCompareMapper = priceCompareMapper;
		this.gooodsMapper = gooodsMapper;
	}	//Constructor

	@Transactional
	@Override
	public List<GoodsVO> getList(GoodsCriteria cri) throws ServiceException {
		log.trace("getList({}) invoked.", cri);
		
		try {
			return this.priceCompareMapper.selectAll(cri);
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	}

	@Override
	public GoodsVO select(Integer goods_id) throws ServiceException {
		log.trace("select({}) invoked. ", goods_id);
		
		try {
			return this.priceCompareMapper.select(goods_id);
		} catch(Exception e) {
			
			throw new ServiceException(e);
		} // try-catch
	} //getList

	@Override
	public Integer getTotalAmount(String keyword, Integer category) throws ServiceException {
		log.trace("getTotalAmount() invoked.");
		
		
		
		try {

			return this.priceCompareMapper.selectTotalCount(keyword);

		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	} //getTotalAmount

	@Override
	public List<GoodsVO> getSearchList(GoodsCriteria cri) throws ServiceException {
		log.trace("getSearchList({}) invoked.", cri);
		
		try {
			return this.priceCompareMapper.selectSearch(cri);
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	} //getSearchList

	@Override
	public boolean updateReadcntOfGoods(Integer goods_id) throws ServiceException {

		Integer numberOfUpdate = this.gooodsMapper.updateGooodsReadcnt(goods_id);
		
		return numberOfUpdate == 1 ? true : false;
	} // updateReadcntOfGoods

} //end class







