package org.zerock.wecart.mapper.pricecompare;

import org.apache.ibatis.annotations.Select;

public interface Capacity_unitMapper {

	
	@Select("""
			SELECT capacity_unit_name
			FROM capacity_unit
			WHERE capacity_unit_id = #{capacity_unit_id}
			""" )
	public abstract String selectCapacityUnitName(String capacity_unit_id);
}
