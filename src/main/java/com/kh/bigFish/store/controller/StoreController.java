package com.kh.bigFish.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bigFish.store.model.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="/storeEnrollForm.sto")
	public String storeEnrollForm() {
		return "store/storeEnrollForm";
		
	}
	
	@RequestMapping(value="/storeUpdateForm.sto")
	public String storeUpdateForm() {
		return "store/storeUpdateForm";
	}
	
	// 사업자 번호 중복체크
	@ResponseBody
	@RequestMapping(value="/checkSameNo")
	public String checkBusinessNo(String businessNo) {
		
		int result = storeService.checkBusinessNo(businessNo);
		
		if(result>0) {
			// 해당 사업자번호 사용 불가 (같은 닉네임 있음)
			return "N";
		}else {
			// 해당 사업자번호 사용 가능 (같은 닉네임 없음)
			return "Y";
		}
		
	}
	

}
