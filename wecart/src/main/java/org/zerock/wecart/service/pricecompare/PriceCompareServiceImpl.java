package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.pricecompare.GoodsCriteria;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.MemberGoodsCartMapper;
import org.zerock.wecart.mapper.pricecompare.PriceCompareMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class PriceCompareServiceImpl implements PriceCompareService {

	private PriceCompareMapper priceCompareMapper;
	private MemberGoodsCartMapper memberGoodsCartMapper; 
	
	@Autowired
	public PriceCompareServiceImpl(PriceCompareMapper priceCompareMapper, MemberGoodsCartMapper memberGoodsCartMapper) {
		this.priceCompareMapper = priceCompareMapper;
		this.memberGoodsCartMapper = memberGoodsCartMapper;
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
	public Integer getTotalAmount(String keyword) throws ServiceException {
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
	public List<Integer> getInstalledCartIdsOfMember(Integer member_id) throws ServiceException{
		log.trace("getMemberGoodsCartListForMember() invoked. ");
		
		try {
			return this.memberGoodsCartMapper.selecAllInstalledCartOfMember(member_id);
		}catch(Exception e) {
			throw new ServiceException(e);
		}
		
	} //getMemberGoodsCartListForMember

	public Integer getTodayCartIdOfMember(Integer member_id) throws ServiceException{
		log.trace("getTodayCartIdOfMember({}) invoked ", member_id);
		
		try {
			Integer check = this.memberGoodsCartMapper.selectTodayCartOfMember(member_id);
			log.trace("check:{}", check);
			return check;
		}catch(Exception e) {
			throw new ServiceException(e);
		}// try-catch
	} // getTodayCartIdOfMember
	
	
	public void saveGoodsIntoTodayCart(Integer member_id, Integer goods_id, Integer cart_id) throws ServiceException{
		log.trace("saveGoodsIntoTodayCart({}, {}, {}) invoked. ", member_id, goods_id, cart_id);
		
		try {
			this.memberGoodsCartMapper.insertRowIntoTodayCart(member_id, goods_id, cart_id);
			
		}catch(Exception e) {
			throw new ServiceException(e);
		} // try - catch;
	} // saveGoodsIntoTodayCart
} //end class







