package com.peace.ostp.persistence;

import java.util.List;

import com.peace.ostp.domain.Carousel;



public interface CarouselMapper {
    int deleteByPrimaryKey(String carouselid);

    int insert(Carousel carousel);

    int insertSelective(Carousel carousel);

    Carousel selectByPrimaryKey(String carouselid);

    int updateByPrimaryKeySelective(Carousel carousel);

    int updateByPrimaryKey(Carousel carousel);

	List<Carousel> getAllCarousel();
}