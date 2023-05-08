package org.zerock.wecart.mapper.pricecompare;

import org.apache.ibatis.annotations.Select;

public interface CategoryMapper {
	
	
	@Select("""
			SELECT category_name
			FROM category
			WHERE category_id = #{category_id} 
			""")
	public abstract String selectCategoryName(Integer category_id);
} // CategoryMapper
