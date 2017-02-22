package com.peace.ostp.service;

import java.util.List;
import java.util.Map;
import com.peace.ostp.domain.PhotoPhotoGraphy;
import com.peace.ostp.util.Page;

public interface IPhotoPhotoGraphy {

    int addPhoto(PhotoPhotoGraphy photophotoGraphy);
	
	int deletePhotoGraphy(String Photoid);
	
	int updatePhotoGraphy(PhotoPhotoGraphy photophotoGraphy);
	
	PhotoPhotoGraphy selectByID(String Photoid);
	
	List<PhotoPhotoGraphy> getAll(Page<PhotoPhotoGraphy> page);
	
	List<PhotoPhotoGraphy> getPhotoGraphy(PhotoPhotoGraphy photophotoGraphy,Map<String, Integer> map);

	int getTotalRecord();

	PhotoPhotoGraphy getPhotographyherf(String pictureid, String photostyleid, String sporttypeid);

}
