package com.kh.bigFish.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	
	@RequestMapping(value="/storeEnrollForm.sto")
	public String storeEnrollForm() {
		return "store/storeEnrollForm";
		
	}
	
	@RequestMapping(value="/storeUpdateForm.sto")
	public String storeUpdateForm() {
		return "store/storeUpdateForm";
	}
	

}
