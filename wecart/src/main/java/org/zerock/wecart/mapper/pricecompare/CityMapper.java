package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.pricecompare.RetailVO;

public interface CityMapper {
	@Select("""
			SELECT *
			FROM retail 
				
			WHERE town_id =
				(
				SELECT town_id
				FROM member
				WHERE member_id = #{member_id}
				)
			""" )
	public abstract List<RetailVO> selectRetailVOOfMember(Integer member_id);
} // CityMapper
