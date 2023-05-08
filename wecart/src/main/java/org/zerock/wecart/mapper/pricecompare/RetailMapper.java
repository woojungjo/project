package org.zerock.wecart.mapper.pricecompare;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.pricecompare.RetailVO;

public interface RetailMapper {
	
	
	
	@Select("""
			SELECT *
			FROM retail
			WHERE retail_name = #{retail_name}
			""" )
	public abstract RetailVO selectRetailVOWithRetailName(String retail_name);
}
