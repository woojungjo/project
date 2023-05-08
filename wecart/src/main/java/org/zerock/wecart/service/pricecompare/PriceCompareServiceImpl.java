package org.zerock.wecart.service.pricecompare;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.domain.pricecompare.GooodsVO;
import org.zerock.wecart.domain.pricecompare.PriceDTO;
import org.zerock.wecart.domain.pricecompare.RetailVO;
import org.zerock.wecart.domain.pricecompare.SaleVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.Capacity_unitMapper;
import org.zerock.wecart.mapper.pricecompare.CategoryMapper;
import org.zerock.wecart.mapper.pricecompare.CityMapper;
import org.zerock.wecart.mapper.pricecompare.GooodsMapper;
import org.zerock.wecart.mapper.pricecompare.PriceCompareMapper;
import org.zerock.wecart.mapper.pricecompare.SaleMapper;
import org.zerock.wecart.mapper.pricecompare.WishListMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class PriceCompareServiceImpl implements PriceCompareService {

	private PriceCompareMapper priceCompareMapper;
	private GooodsMapper gooodsMapper;
	private WishListMapper wishListMapper;
	private CityMapper cityMapper;
	private SaleMapper saleMapper;
	private CategoryMapper categoryMapper;
	private Capacity_unitMapper capacity_unitMapper;
	
	@Autowired
	public PriceCompareServiceImpl(PriceCompareMapper priceCompareMapper, GooodsMapper gooodsMapper, WishListMapper wishListMapper, SaleMapper saleMapper, CityMapper cityMapper, CategoryMapper categoryMapper, Capacity_unitMapper capacity_unitMapper) {
		this.priceCompareMapper = priceCompareMapper;
		this.gooodsMapper = gooodsMapper;
		this.wishListMapper = wishListMapper;
		this.cityMapper = cityMapper;
		this.saleMapper = saleMapper;
		this.categoryMapper = categoryMapper;
		this.capacity_unitMapper = capacity_unitMapper;
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

			return this.priceCompareMapper.selectTotalCount(keyword, category);

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
	
	@Override
	public List<PriceDTO> getPriceDTOList(Integer member_id, Integer goods_id) throws ServiceException{
		log.trace("getPriceDTOList(member_id: {}, goods_id: {}) invoked");

		List<PriceDTO> priceDTO = new ArrayList<PriceDTO>();
		try {
			// 0.  api의 최신날짜 얻기
			Date latestDate = this.saleMapper.selectAPIDate();
			
			// 1. member 아이디를 통해 RetailVO를 얻고
			// 2. 해당 town_id를 가지고 있는데 retail 정보들을 얻는다.
			List<RetailVO> retailList = this.cityMapper.selectRetailVOOfMember(member_id);
			
			// 3. SALE 테이블에서 latestDate, goods_id와 retail_id을 조인하여 가격을 얻는다. 
			for(RetailVO retail : retailList) {
				
				Integer retailId = retail.getRetail_id();
		
				SaleVO sale = this.saleMapper.selectPriceWithRetail_idAndGoods_id(latestDate, retailId, goods_id);
	
				PriceDTO dto = new PriceDTO();
				dto.setRetail_name(retail.getRetail_name());
				dto.setPrice(sale.getPrice());
				priceDTO.add(dto);
			} // for
			
			}catch(Exception e) { ;; }
		
		
		log.trace("error check1 ");
		return priceDTO;
	}

	@Override
	public GooodsVO selectGooodsVO(Integer goods_id) throws ServiceException {
		log.trace("selectGooodsVO(goods_id: {} ) invoked. ");
		
		try {
			return this.gooodsMapper.selectGooodsVO(goods_id);
		}catch(Exception e) {
			log.trace("selectGooodsVO service has erorr.");
		}
		return null;
	} // selectGooodsVO
	
	public String selectCategoryName(Integer category_id) throws ServiceException{
		
		try {
			return this.categoryMapper.selectCategoryName(category_id);
		
		}catch(Exception e) {
			;;
		}
		return null;
	}

	@Override
	public String selectCapacityUnitName(String capacity_unit_id) throws ServiceException {

		
		try {
			return this.capacity_unitMapper.selectCapacityUnitName(capacity_unit_id);
		}
		catch(Exception e) {
			;;
		} // try - catch
		
		return null;
	} // selectCapacityUnitName
} //end class
