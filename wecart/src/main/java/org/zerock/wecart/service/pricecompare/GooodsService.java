package org.zerock.wecart.service.pricecompare;

import org.zerock.wecart.domain.pricecompare.GooodsVO;

public interface GooodsService {
	
	public abstract GooodsVO selectGooodsVO(Integer goods_id);
	
}
