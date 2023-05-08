package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.domain.pricecompare.GooodsVO;
import org.zerock.wecart.domain.pricecompare.PriceDTO;
import org.zerock.wecart.exception.ServiceException;

public interface PriceCompareService {



	//1. 상품 전체 목록 조회
	public abstract List<GoodsVO> getList(GoodsCriteria cri) throws ServiceException;
	
	//2. 총 상품 개수 반환
	public abstract Integer getTotalAmount(String keyword, Integer category) throws ServiceException;
	
	//3. 상품 검색 목록
	public abstract List<GoodsVO> getSearchList(GoodsCriteria cri) throws ServiceException;
  
	//4. id에 해당하는 상품 조회
	public abstract GoodsVO select(Integer goods_id) throws ServiceException;

	// goods_id를 받고 해당 조회수를 ++한다. 만약 update가 안됐으면 false를 return한다.
	public abstract boolean updateReadcntOfGoods(Integer goods_id) throws ServiceException;
	
	// member 아이디에 town_id 와 member가 클릭한 goods을 가지고 
	// 해당 상품을 판매하는 retail등의 정보를 가지고 있는 PriceDTO 반환  
	public List<PriceDTO> getPriceDTOList(Integer member_id, Integer goods_id) throws ServiceException;
	
	// goods_id를 가지고 GooodsVO 객체를 반환
	public abstract GooodsVO selectGooodsVO(Integer goods_id) throws ServiceException;
	
	// categoryName을 return한다.
	public abstract String selectCategoryName(Integer category_id) throws ServiceException;
	
	// capacity_unit_id를 가지고 CapacityUnitName
	public abstract String selectCapacityUnitName(String capacity_unit_id) throws ServiceException;
} //end interface
