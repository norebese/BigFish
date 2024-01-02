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
import com.kh.bigFish.shop.model.service.ShopService;
import com.kh.bigFish.shop.model.vo.Shop;
import com.kh.bigFish.store.model.service.StoreService;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.study.model.service.StudyService;
import com.kh.bigFish.study.model.vo.Study;

@Controller
public class SearchController {
	
	@Autowired
	private StudyService searchService;
	
	@Autowired
	private FishingBoardService searchService1;
	
	@Autowired 
	private FreeBoardService searchService2;
	
	@Autowired
	private StoreService searchService3;
	
	@Autowired
	private StoreService searchService4;
	
	@Autowired
	private ShopService searchService5;
	
	@RequestMapping(value="/search.bo")
	public ModelAndView searchResult(String keyword, ModelAndView mv) {
		System.out.println(keyword);
		ArrayList<Study> list = searchService.selectStudyList(keyword); 
		ArrayList<FishingBoard> list1 = searchService1.selectFishingList(keyword);
		ArrayList<FreeBoard> list2 = searchService2.selectFreeList(keyword);
		ArrayList<Store> seaStoreList = searchService3.selectStoreList(keyword);
		ArrayList<Store> fishStoreList = searchService4.selectFishStoreList(keyword);
		ArrayList<Shop> shopList = searchService5.selectShopList(keyword);
		
		System.out.println(list);
		System.out.println(list1);
		System.out.println(list2);
		System.out.println(seaStoreList);
		
		mv.addObject("list", list)
		  .addObject("list1", list1)
		  .addObject("list2", list2)
		  .addObject("seaStoreList", seaStoreList)
		  .addObject("fishStoreList", fishStoreList)
		  .addObject("shopList", shopList)
		  .addObject("keyword", keyword)
		  .setViewName("common/searchPage");
		
		return mv;
	}
}
