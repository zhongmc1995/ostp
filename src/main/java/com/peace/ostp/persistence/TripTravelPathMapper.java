package com.peace.ostp.persistence;

import com.peace.ostp.domain.TripTravelPath;

public interface TripTravelPathMapper {
    int deleteByPrimaryKey(String travelid);

    int insert(TripTravelPath record);

    int insertSelective(TripTravelPath record);

    TripTravelPath selectByPrimaryKey(String travelid);

    int updateByPrimaryKeySelective(TripTravelPath record);

    int updateByPrimaryKey(TripTravelPath record);
}