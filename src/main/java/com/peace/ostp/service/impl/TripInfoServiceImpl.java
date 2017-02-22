package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.TripTravelInfo;
import com.peace.ostp.persistence.TripTravelInfoMapper;
import com.peace.ostp.service.ITripInfo;

/**
 * 行程实现
 * 
 * @author YLS
 *
 */
@Service
public class TripInfoServiceImpl implements ITripInfo {

	@Autowired
	TripTravelInfoMapper tripTravelInfoMapper;
	
	/**
	 * 添加行程
	 */
	@Override
	public int insert(TripTravelInfo tripTravelInfo) {
		try {
			return tripTravelInfoMapper.insert(tripTravelInfo);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	/**
	 * 查找行程
	 */
	@Override
	public List<TripTravelInfo> getTripInfos(TripTravelInfo tripTravelInfo, Map<String, Integer> map) {
		try {
			return tripTravelInfoMapper.getTripInfos(tripTravelInfo,map);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}


	/**
	 * 查找指定行程
	 */
	@Override
	public TripTravelInfo getTripInfoByID(String travelid, String sporttypeid) {
		try {
			return tripTravelInfoMapper.getTripInfoByID(travelid,sporttypeid);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	/**
	 * 修改行程
	 */
	@Override
	public int updateTripInfo(TripTravelInfo tripTravelInfo) {
		try {
			return tripTravelInfoMapper.updateByPrimaryKeySelective(tripTravelInfo);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public int deleteTripInfo(String travelid) {
		try {
			return tripTravelInfoMapper.deleteByPrimaryKey(travelid);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public int getTotalRecord(TripTravelInfo tripTravelInfo) {
		// TODO Auto-generated method stub
		return tripTravelInfoMapper.getTotalRecord(tripTravelInfo);
	}

}
