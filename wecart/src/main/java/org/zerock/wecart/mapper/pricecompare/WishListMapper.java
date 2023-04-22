package org.zerock.wecart.mapper.pricecompare;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.pricecompare.GooodsVO;

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
	
	@Select("""
            SELECT *
			FROM goods
			JOIN 
				wish_list
			ON 
                wish_list.member_id = #{member_id}
            AND 
                goods.goods_id = wish_list.goods_id
			""" )
	public abstract List<GooodsVO> selectGooodVoOfMember(Integer member_id); 
	
}
