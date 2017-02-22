package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.PositionDetailInfo;
import com.peace.ostp.persistence.PositionDetailInfoMapper;
import com.peace.ostp.persistence.PositionTypeInfoMapper;
import com.peace.ostp.service.IPositionInfo;

/**
 * 位置实现
 * @author YLS
 *
 */
//@Service("one")当一个接口有多个实现类的时候，可以使用@Qualifier中的参数和@Service中的参数配合使用，从而实现多实现的自动注入
@Service
public class PositionInfoServiceImpl implements IPositionInfo {
	
	@Autowired
	private PositionDetailInfoMapper positionDetailInfoMapper;
	
	@Autowired
	private PositionTypeInfoMapper positionTypeInfoMapper;

	/**
	 * 加载初始数据
	 */
	@Override
	public List<Map<String, String>> getPositionType() {
		try {
			return positionTypeInfoMapper.getPositionType();
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	/**
	 * 添加位置
	 */
	@Override
	public int insert(PositionDetailInfo positionDetailInfo) {
		try {
			return positionDetailInfoMapper.insert(positionDetailInfo);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	/**
	 * 查询位置
	 */
	@Override
	public List<PositionDetailInfo> getPositionInfos(
			PositionDetailInfo positionDetailInfo, Map<String, Integer> map) {
		try {
			return positionDetailInfoMapper.getPositionInfos(positionDetailInfo, map);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	/**
	 * 查看位置详细信息
	 */
	@Override
	public PositionDetailInfo getPositionInfo(String positionid,
			String positiontypeid, String sporttypeid) {
		try {
			return positionDetailInfoMapper.getPositionInfo(positionid, positiontypeid, sporttypeid);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	/**
	 * 更新位置信息
	 */
	@Override
	public int updatePositionInfo(PositionDetailInfo positionDetailInfo) {
		try {
			return positionDetailInfoMapper.updatePositionInfo(positionDetailInfo);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	/**
	 * 删除位置
	 */
	@Override
	public void deleteByPrimaryKey(String positionid) {
		try {
			positionDetailInfoMapper.deleteByPrimaryKey(positionid);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public int getTotalRecord(PositionDetailInfo positionDetailInfo) {
		// TODO Auto-generated method stub
		return positionDetailInfoMapper.getTotalRecord(positionDetailInfo);
	}

}
