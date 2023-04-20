package org.zerock.wecart.service.pricecompare;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.MemberGoodsCartMapper;
import org.zerock.wecart.mapper.pricecompare.SaleMapper;
import org.zerock.wecart.mapper.pricecompare.WishListMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class MypageCartServiceImpl implements MypageCartService{


	private MemberGoodsCartMapper memberGoodsCartMapper; 
	private WishListMapper wishListMapper;
	private SaleMapper saleMapper;

	@Autowired
	public MypageCartServiceImpl(MemberGoodsCartMapper memberGoodsCartMapper, WishListMapper wishListMapper, SaleMapper salemapper) {
		this.memberGoodsCartMapper = memberGoodsCartMapper;
		this.wishListMapper = wishListMapper;
		this.saleMapper = saleMapper;
	} // Constructor
	
	@Override
	public List<Integer> getInstalledCartIdsOfMember(Integer member_id) throws ServiceException{
		log.trace("getMemberGoodsCartListForMember() invoked. ");
		
		try {
			return this.memberGoodsCartMapper.selecAllInstalledCartOfMember(member_id);
		}catch(Exception e) {
			throw new ServiceException(e);
		}
		
	} //getMemberGoodsCartListForMember

	@Override
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
	
	@Override
	public void saveGoodsIntoTodayCart(Integer member_id, Integer goods_id, Integer cart_id) throws ServiceException{
		log.trace("saveGoodsIntoTodayCart({}, {}, {}) invoked. ", member_id, goods_id, cart_id);
		
		try {
			this.memberGoodsCartMapper.insertRowIntoTodayCart(member_id, goods_id, cart_id);
			
		}catch(Exception e) {
			throw new ServiceException(e);
		} // try - catch;
		
	} // saveGoodsIntoTodayCart
	

	@Override
	public void saveGoodsIntoWishList(Integer member_id, Integer goods_id) throws ServiceException{
		log.trace("saveGoodsIntoWishlist(member_id: {}, goods_id: {}) invoked. ", member_id, goods_id);
		
		try {
			this.wishListMapper.insertGoodsIntoWishedCart(member_id, goods_id);
		}catch(Exception e) {
			throw new ServiceException(e);
		}
	} //saveGoodsIntoWishlist

	@Override
	public void deleteGoodsFromWishList(Integer member_id, Integer goods_id) throws ServiceException{
		log.trace("deleteGoodsFromWishlist(member_id: {}, goods_id: {}) invoked. ", member_id, goods_id);
		
		try {
			this.wishListMapper.deleteGoodsFromWishedCart(member_id, goods_id);;
		}catch(Exception e) {
			throw new ServiceException(e);
		}
	} // deleteGoodsFromWishlist
	
	@Override
	public void createTodayCart() {
		log.trace("createTodayCart() invoked. ");
		
		//최신 API날짜를 가져오고
		Date value = this.saleMapper.selectAPIDate();
		Timestamp latestAPIDate = new Timestamp(value.getTime()); 
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		
		
		
	} // createTodayCart
	
}
