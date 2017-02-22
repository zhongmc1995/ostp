package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.peace.ostp.domain.PositionDetailInfo;

public interface PositionDetailInfoMapper {
    int deleteByPrimaryKey(String positionid);

    int insert(PositionDetailInfo record);

    int insertSelective(PositionDetailInfo record);

    PositionDetailInfo selectByPrimaryKey(String positionid);

    int updateByPrimaryKeySelective(PositionDetailInfo record);

    int updateByPrimaryKey(PositionDetailInfo record);

	PositionDetailInfo getPositionInfo(String positionid,
			String positiontypeid, String sporttypeid);

	int updatePositionInfo(PositionDetailInfo positionDetailInfo);

	List<PositionDetailInfo> getPositionInfos(
			@Param("positionDetailInfo") PositionDetailInfo positionDetailInfo, @Param("page") Map<String, Integer> map);

	int getTotalRecord(PositionDetailInfo positionDetailInfo);
}