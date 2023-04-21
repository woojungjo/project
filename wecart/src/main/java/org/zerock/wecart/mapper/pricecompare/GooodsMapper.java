package org.zerock.wecart.mapper.pricecompare;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.pricecompare.GooodsVO;

public interface GooodsMapper {
	
	@Select(""" 
			SELECT *
			FROM goods
			WHERE goods_id = #{goods_id}
			""")
	public abstract GooodsVO selectGooodsVO(Integer goods_id);
	
}
