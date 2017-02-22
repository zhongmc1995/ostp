package com.peace.ostp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.peace.ostp.domain.PhotoPhotoGraphy;
import com.peace.ostp.persistence.PhotoPhotoGraphyMapper;
import com.peace.ostp.service.IPhotoPhotoGraphy;
import com.peace.ostp.util.Page;
@Service
public class PhotoPhotoGraphyImpl implements IPhotoPhotoGraphy{
	@Autowired
	public PhotoPhotoGraphyMapper photophotographyMapper;
	@Override
	public int addPhoto(PhotoPhotoGraphy photophotography) {
		// TODO Auto-generated method stub
		try {
			return photophotographyMapper.insert(photophotography);

		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public int deletePhotoGraphy(String Photoid) {
		// TODO Auto-generated method stub
		try {
			 return photophotographyMapper.deleteByPrimaryKey(Photoid);

		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public int updatePhotoGraphy(PhotoPhotoGraphy photophotoGraphy) {
		// TODO Auto-generated method stub
		try {
			return photophotographyMapper.updateByPrimaryKeySelective(photophotoGraphy);

		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public PhotoPhotoGraphy selectByID(String Photoid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public PhotoPhotoGraphy getPhotographyherf(String pictureid, String photostyleid, String sporttypeid){
		// TODO Auto-generated method stub
				try {
					return photophotographyMapper.selectPhotographyherf(pictureid,photostyleid,sporttypeid);

				} catch (Exception e) {
					if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
						throw new RuntimeException("duplicate-username");
					else
						throw new RuntimeException(e.getMessage());
				}
	}
	
	@Override
	public List<PhotoPhotoGraphy> getAll(Page<PhotoPhotoGraphy> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PhotoPhotoGraphy> getPhotoGraphy(PhotoPhotoGraphy photophotoGraphy, Map<String, Integer> map) {
		// TODO Auto-generated method stub
		try {
			return photophotographyMapper.selectPhotoGraphy(photophotoGraphy, map);
		} catch (Exception e) {
			if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else
				throw new RuntimeException(e.getMessage());
		}
	}
	
	@Override
	public int getTotalRecord(){
		// TODO Auto-generated method stub
				try {
					return	photophotographyMapper.selectTotalRecord();

				} catch (Exception e) {
					if (e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
						throw new RuntimeException("duplicate-username");
					else
						throw new RuntimeException(e.getMessage());
				}
		
	}
	/*@Override
	public BasicInfo selectPhotoGraphy(String Photoid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BasicInfo> getAll(Page<PhotoPhotoGraphy> page) {
		// TODO Auto-generated method stub
		return null;
	}*/

}
