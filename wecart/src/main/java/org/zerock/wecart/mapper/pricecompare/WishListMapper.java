package org.zerock.wecart.mapper.pricecompare;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

public interface WishListMapper {
	
	// goods_id와 member_id를 테이블에 등록
	@Insert("""
			INSERT INTO wish_list ( member_id, goods_id )
			VALUES (#{member_id}, #{goods_id})
			""")
	public abstract void insertGoodsIntoWishedCart(Integer member_id, Integer goods_id);
	
	
	@Delete("""
			
			DELETE FROM wish_list
			WHERE 
				member_id = #{member_id}
			AND
				goods_id = #{goods_id}
			""")
	// goods_id와 member_id를 테이블에서 삭제
	public abstract void deleteGoodsFromWishedCart(Integer member_id, Integer goods_id);
	
}
