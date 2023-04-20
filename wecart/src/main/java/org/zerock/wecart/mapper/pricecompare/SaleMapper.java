package org.zerock.wecart.mapper.pricecompare;

import java.sql.Date;

import org.apache.ibatis.annotations.Select;

public interface SaleMapper {
	
	@Select("""
			SELECT max(api_date)
			FROM sale
			""")
	public abstract Date selectAPIDate();
} // end class
