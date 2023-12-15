package com.kh.bigFish.search.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.fishingBoard.model.service.FishingBoardService;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;
import com.kh.bigFish.freeBoard.model.service.FreeBoardService;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;
import com.kh.bigFish.study.model.service.StudyService;
import com.kh.bigFish.study.model.vo.Study;

@Controller
public class SearchController {
	
	@Autowired
	private StudyService searchService;
	
	@Autowired
	private FishingBoardService searchService1;
	
	@Autowired FreeBoardService searchService2;
	
	@RequestMapping(value="/search.bo")
	public ModelAndView searchResult(String keyword, ModelAndView mv) {
		System.out.println(keyword);
		ArrayList<Study> list = searchService.selectStudyList(keyword); 
		ArrayList<FishingBoard> list1 = searchService1.selectFishingList(keyword);
		ArrayList<FreeBoard> list2 = searchService2.selectFreeList(keyword);
		System.out.println(list);
		System.out.println(list1);
		System.out.println(list2);
		mv.addObject("list", list)
		  .addObject("list1", list1)
		  .addObject("list2", list2)
		  .addObject("keyword", keyword)
		  .setViewName("common/searchPage");
		
		return mv;
	}
}
