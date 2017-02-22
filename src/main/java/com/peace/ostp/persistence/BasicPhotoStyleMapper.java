package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import com.peace.ostp.domain.BasicPhotoStyle;

public interface BasicPhotoStyleMapper {
    int deleteByPrimaryKey(String photostyleid);

    int insert(BasicPhotoStyle basicPhotoStyle);

    int insertSelective(BasicPhotoStyle basicPhotoStyle);

    BasicPhotoStyle selectByPrimaryKey(String photostyleid);

    int updateByPrimaryKeySelective(BasicPhotoStyle basicPhotoStyle);

    int updateByPrimaryKey(BasicPhotoStyle basicPhotoStyle);


	List<BasicPhotoStyle> getAllPhotoStyle();

	List<Map<String, String>> getAllPhotoStyleStr();
}