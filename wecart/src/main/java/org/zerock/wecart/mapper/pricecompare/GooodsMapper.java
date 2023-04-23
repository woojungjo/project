package org.zerock.wecart.mapper.pricecompare;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zerock.wecart.domain.pricecompare.GooodsVO;

public interface GooodsMapper {
	
	@Select(""" 
			SELECT *
			FROM goods
			WHERE goods_id = #{goods_id}
			""")
	public abstract GooodsVO selectGooodsVO(Integer goods_id);
	
	
	@Update("""
			UPDATE goods
			SET readcnt = readcnt+1
			WHERE goods_id = #{goods_id}
			""")
	public abstract Integer updateGooodsReadcnt(Integer goods_id);
	
}
