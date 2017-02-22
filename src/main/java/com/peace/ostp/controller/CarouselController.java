package com.peace.ostp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peace.ostp.domain.BasicEquipType;
import com.peace.ostp.domain.BasicSportType;
import com.peace.ostp.domain.Carousel;
import com.peace.ostp.domain.CourseInfo;
import com.peace.ostp.domain.CourseType;
import com.peace.ostp.domain.Message;
import com.peace.ostp.security.UserInfo;
import com.peace.ostp.service.ICarousel;

@Controller
@RequestMapping("/admin")
public class CarouselController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	
	@Autowired
	private ICarousel iCarousel;
	
	@RequestMapping(value = "/carousel-list", method = RequestMethod.GET)
	public String getAllCarousel(Model model, HttpServletRequest request) {
		
		List<Carousel> carouselList = iCarousel.getAllCarousel();
		model.addAttribute("carouselList", carouselList);
		return "admin/carousel/carousel_list";
	}
	
	@RequestMapping(value = "/carousel-add")
	public String addcarousel(Model model, HttpServletRequest request) {
		
		return "admin/carousel/carousel_add";
	}
	
	@RequestMapping(value = "/carousel-insert", method = RequestMethod.GET)
	public String insertCarousel(Model model,Carousel carousel, HttpServletRequest request) {
		Message message = new Message();
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		carousel.setCarouselid(UUID.randomUUID().toString().replace("-", ""));
		carousel.setCreateBy(userInfo.getUserName());
		carousel.setCreateDate(new Date());
		carousel.setUpdateBy(userInfo.getUserName());
		carousel.setUpdateDate(new Date());
		
		int carouselList = iCarousel.insertCarousel(carousel);
		if(carouselList > 0){
			return "redirect:/admin/carousel-list";
		} else {
			return "admin/carousel/carousel_list";
		}
	}
	
	@RequestMapping(value = "/carousel-view/{carouselid}", method = RequestMethod.GET)
	public String CarouselView(Model model, HttpServletRequest request,@PathVariable("carouselid")String carouselid) {
		Carousel carouselList = iCarousel.selectByPrimaryKey(carouselid);
		model.addAttribute("carouselList", carouselList);
		return "admin/carousel/carousel_view";
	}
	
	@RequestMapping(value = "/carousel-edit/{carouselid}", method = RequestMethod.GET)
	public String Carousel_update(Model model, HttpServletRequest request,@PathVariable("carouselid")String carouselid) {	
		Carousel carouselList = iCarousel.selectByPrimaryKey(carouselid);
		//System.out.println("111111111111111111111"+carouselList);
		model.addAttribute("carouselList", carouselList);
		return "admin/carousel/carousel_edit";
	}
	
	@RequestMapping(value = "/carousel-update", method = RequestMethod.POST)
	public String updateSportType(Carousel carousel) {
			UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			carousel.setUpdateBy(userInfo.getUserName());
			carousel.setUpdateDate(new Date());
			System.out.println("fdsafdsafdsafdsafdsaf");
			iCarousel.updateByPrimaryKey(carousel);
		return "redirect:/admin/carousel-list";
	}
	@RequestMapping(value = "/carousel-del/{carouselid}", method = RequestMethod.GET)
	public String delCarousel(@PathVariable("carouselid")String carouselid) {
		Message message = new Message();
		try {
			iCarousel.deleteByPrimaryKey(carouselid);
			message.setResult(SUCCESS_MESSAGE);
			message.setMessageInfo("删除成功！");

		} catch (Exception e) {
			message.setResult(ERROR_MESSAGE);
			message.setMessageInfo("删除失败！");
			e.printStackTrace();
		}
		return "redirect:/admin/carousel-list";
	}
}
