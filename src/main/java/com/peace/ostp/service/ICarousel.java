package com.peace.ostp.service;

import java.util.List;

import com.peace.ostp.domain.Carousel;

public interface ICarousel {

	List<Carousel> getAllCarousel();

	int insertCarousel(Carousel carousel);

	Carousel selectByPrimaryKey(String carouselid);

	int updateByPrimaryKey(Carousel carousel);

	int deleteByPrimaryKey(String carouselid);

}
