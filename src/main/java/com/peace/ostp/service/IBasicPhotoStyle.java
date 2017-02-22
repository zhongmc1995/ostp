package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.BasicPhotoStyle;

public interface IBasicPhotoStyle {
	
	List<BasicPhotoStyle> getAllPhotoStyle();

	boolean insertPhotoStyle(BasicPhotoStyle basicPhotoStyle);

	boolean deleteByPrimaryKey(String photostyleid);

	int updatePhotoStyle(BasicPhotoStyle basicPhotoStyle);

	List<Map<String, String>> getAllPhotoStyleStr();

}
