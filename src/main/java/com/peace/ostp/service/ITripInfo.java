package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.TripTravelInfo;

/**
 * 行程接口
 * @author YLS
 *
 */
public interface ITripInfo {
	
/*	int deleteByPrimaryKey(String travelid);*/

    int insert(TripTravelInfo record);
    
    List<TripTravelInfo> getTripInfos(TripTravelInfo tripTravelInfo, Map<String, Integer> map);
    
   // TripTravelInfo getTripInfoByID(String travelid);
/*
    int insertSelective(TripTravelInfo record);

    TripTravelInfo selectByPrimaryKey(String travelid);

    int updateByPrimaryKeySelective(TripTravelInfo record);

    int updateByPrimaryKey(TripTravelInfo record);*/

	TripTravelInfo getTripInfoByID(String travelid, String sporttypeid);

	int updateTripInfo(TripTravelInfo tripTravelInfo);

	int deleteTripInfo(String travelid);

	int getTotalRecord(TripTravelInfo tripTravelInfo);

}
