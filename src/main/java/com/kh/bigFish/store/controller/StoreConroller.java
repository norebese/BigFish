package com.kh.bigFish.store.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bigFish.store.model.service.StoreService;
import com.kh.bigFish.store.model.vo.Store;

@Controller
public class StoreConroller {

	@Autowired
	private StoreService storeService;
	
	@ResponseBody
	@RequestMapping(value="ajaxStoreList", produces="application/json; charset=UTF-8")
	public ArrayList<Store> ajaxStoreList(Store S ,HttpServletRequest request) {
		String Region = request.getParameter("selectedRegion");
		String City = request.getParameter("selectedCity");
		
		S.setLocationBig(Region);
		S.setLocationSmall(City);
		
		ArrayList<Store> list = storeService.ajaxStoreList(S);
		
		return list;
	}
	
	@RequestMapping("resDetailPage")
	public String resDetailPage(HttpServletRequest request, HttpSession session) {
		int storeNum = Integer.parseInt(request.getParameter("storeNumber"));
		
		Store st = storeService.resDetailPage(storeNum);
		
		List<String> fishKinds = Arrays.asList(st.getStoreFishKind().split("/"));
		
		session.setAttribute("st", st);
		session.setAttribute("fishKinds", fishKinds);
		
		return "reservation/reservationDetail";
	}
	
	
	
	
}
