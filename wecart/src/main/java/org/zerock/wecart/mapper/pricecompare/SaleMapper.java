package org.zerock.wecart.mapper.pricecompare;

import java.sql.Date;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.pricecompare.SaleVO;

public interface SaleMapper {
	
	@Select("""
			SELECT max(api_date)
			FROM sale
			""")
	public abstract Date selectAPIDate();
	
	@Select("""
			SELECT *
			FROM sale
			WHERE api_date = #{api_date}
			AND	retail_id = #{retail_id}
			AND goods_id = #{goods_id}
			""" )
	public abstract SaleVO selectPriceWithRetail_idAndGoods_id(Date api_date, Integer retail_id, Integer goods_id);
} // end class
