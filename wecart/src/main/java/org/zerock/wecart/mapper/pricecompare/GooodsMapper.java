package org.zerock.wecart.mapper.pricecompare;

import org.zerock.wecart.domain.pricecompare.GooodsVO;

public interface GooodsMapper {
	public abstract GooodsVO selectGooods(Integer goods_id);
	
}
