package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.peace.ostp.domain.TripTravelInfo;

public interface TripTravelInfoMapper {
    int deleteByPrimaryKey(String travelid);

    int insert(TripTravelInfo record);

    int insertSelective(TripTravelInfo record);

    TripTravelInfo selectByPrimaryKey(String travelid);

    int updateByPrimaryKeySelective(TripTravelInfo record);

    int updateByPrimaryKey(TripTravelInfo record);

	List<TripTravelInfo> getTripInfos(@Param("tripTravelInfo") TripTravelInfo tripTravelInfo, @Param("page") Map<String, Integer> map);

	TripTravelInfo getTripInfoByID(String travelid, String sporttypeid);
	
	int getTotalRecord(TripTravelInfo tripTravelInfo);
}