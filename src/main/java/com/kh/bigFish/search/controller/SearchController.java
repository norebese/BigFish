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
		
		// 공백 또는 null 체크
	    if (keyword != null) {
	    	keyword = keyword.trim();  // 조건에 따라 trim 적용

	        // 둘 중 하나라도 비어있으면 검색을 수행하지 않음
	        if (keyword.isEmpty()) {
	            // 검색 조건이 부족하므로 적절한 처리를 할 수 있도록 구현
	            // 예를 들면 오류 메시지를 설정하거나, 다른 페이지로 리다이렉트 등을 수행할 수 있음
	            mv.setViewName("common/searchPage"); // 예시로 에러 페이지로 이동하도록 설정
	            mv.addObject("alertMsg", "검색 조건이 부족합니다.");
	            return mv;
	        }
	    }
		
		ArrayList<Study> list = searchService.selectStudyList(keyword); 
		ArrayList<FishingBoard> list1 = searchService1.selectFishingList(keyword);
		ArrayList<FreeBoard> list2 = searchService2.selectFreeList(keyword);
		ArrayList<Store> seaStoreList = searchService3.selectStoreList(keyword);
		ArrayList<Store> fishStoreList = searchService4.selectFishStoreList(keyword);
		ArrayList<Shop> shopList = searchService5.selectShopList(keyword);
		
		System.out.println(list);
		System.out.println(list1);
		System.out.println(list2);
		System.out.println(fishStoreList);
		
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
