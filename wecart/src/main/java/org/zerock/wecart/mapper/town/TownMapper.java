package org.zerock.wecart.mapper.town;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface TownMapper {
	
//	@Update("UPDATE town SET town_name = #{townName} WHERE town_id = (SELECT town_id FROM member WHERE login_id = #{loginId})")
	@Update("UPDATE member SET town_id = (SELECT town_id FROM CITY WHERE CITY_NAME = #{townName}) WHERE login_id = #{loginId}")
	public abstract Integer updateTownName(@Param("townName") String townName, @Param("loginId") String loginId);
}//interface
