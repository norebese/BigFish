package com.kh.bigFish.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bigFish.shop.model.service.ShopService;
import com.kh.bigFish.study.model.service.StudyService;


@Controller
public class ShopController {
	
	@Autowired
//	private ShopService shopService;
	
	@RequestMapping(value="/list.sh")
	public String shopList() {
		
		return "shop/shopListView";
	}
	
	@RequestMapping("enrollForm.sh")
	public String enrollForm() {
	
		return "shop/shopEnrollForm";
	}
}
