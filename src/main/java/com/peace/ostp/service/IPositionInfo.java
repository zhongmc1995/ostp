package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.PositionDetailInfo;

/**
 * 位置接口
 * @author YLS
 *
 */
public interface IPositionInfo {

	List<Map<String, String>> getPositionType();

	int insert(PositionDetailInfo positionDetailInfo);

	List<PositionDetailInfo> getPositionInfos(
			PositionDetailInfo positionDetailInfo, Map<String, Integer> map);

	PositionDetailInfo getPositionInfo(String positionid,
			String positiontypeid, String sporttypeid);

	int updatePositionInfo(PositionDetailInfo positionDetailInfo);

	void deleteByPrimaryKey(String positionid);

	int getTotalRecord(PositionDetailInfo positionDetailInfo);

}
