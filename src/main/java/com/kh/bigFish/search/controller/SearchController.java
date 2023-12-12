package com.kh.bigFish.search.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.study.model.service.StudyService;
import com.kh.bigFish.study.model.vo.Study;

@Controller
public class SearchController {
	
	@Autowired
	private StudyService searchService;
	
	@RequestMapping(value="/search.bo")
	public ModelAndView searchResult(String keyword, ModelAndView mv) {
		System.out.println(keyword);
		ArrayList<Study> list = searchService.selectSearchList(keyword); 
		
		mv.addObject("list", list)
		  .addObject("keyword", keyword)
		  .setViewName("common/searchPage");
		
		return mv;
	}
}
