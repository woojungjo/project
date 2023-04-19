package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.MemberGoodsCartMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class MypageCartServiceImpl implements MypageCartService{

	private MemberGoodsCartMapper memberGoodsCartMapper; 

	@Autowired
	public MypageCartServiceImpl(MemberGoodsCartMapper memberGoodsCartMapper) {
		this.memberGoodsCartMapper = memberGoodsCartMapper;

	}
	
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
}
