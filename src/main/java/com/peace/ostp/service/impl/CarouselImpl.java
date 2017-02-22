package com.peace.ostp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peace.ostp.domain.Carousel;
import com.peace.ostp.persistence.CarouselMapper;
import com.peace.ostp.service.ICarousel;

@Service
public class CarouselImpl implements ICarousel {
	
	@Autowired
	private CarouselMapper carouselMapper;

	@Override
	public List<Carousel> getAllCarousel() {
		// TODO Auto-generated method stub
		return carouselMapper.getAllCarousel();
	}

	@Override
	public int insertCarousel(Carousel carousel) {
		// TODO Auto-generated method stub
		return carouselMapper.insert(carousel);
	}

	@Override
	public Carousel selectByPrimaryKey(String carouselid) {
		// TODO Auto-generated method stub
		return carouselMapper.selectByPrimaryKey(carouselid);
	}

	@Override
	public int updateByPrimaryKey(Carousel carousel) {
		// TODO Auto-generated method stub
		return carouselMapper.updateByPrimaryKey(carousel);
	}

	@Override
	public int deleteByPrimaryKey(String carouselid) {
		// TODO Auto-generated method stub
		return carouselMapper.deleteByPrimaryKey(carouselid);
	}
	

}
