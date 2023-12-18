package com.kh.bigFish.fish.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.fish.model.service.FishService;

@Controller
public class FishController {
	
	@Autowired
	private FishService fishService;
	
	@RequestMapping(value="fishInfo.fi")
	public ModelAndView AnnounceList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(fishService.selectListCount(), currentPage, 10, 5);
		
			mv.addObject("pi",pi)
			  .addObject("list", fishService.selectList(pi))
			  .setViewName("fishInfo/fishInfo");
		
		return mv;
	}
}
