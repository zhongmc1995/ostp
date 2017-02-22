package com.peace.ostp.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.peace.ostp.domain.PhotoPhotoGraphy;

public interface PhotoPhotoGraphyMapper {
   

    int insert(PhotoPhotoGraphy record);

    int insertSelective(PhotoPhotoGraphy record);

    int deleteByPrimaryKey(String pictureid);
    
    int updateByPrimaryKeySelective(PhotoPhotoGraphy photophotoGraphy);

    int updateByPrimaryKey(PhotoPhotoGraphy record);
    
    PhotoPhotoGraphy selectByPrimaryKey(String pictureid);
    
    List<PhotoPhotoGraphy> selectPhotoGraphy(@Param("photophotoGraphy") PhotoPhotoGraphy photophotoGraphy,@Param("page") Map<String, Integer> map);
    
    int selectTotalRecord();

    PhotoPhotoGraphy selectPhotographyherf(String pictureid, String photostyleid, String sporttypeid);

	}