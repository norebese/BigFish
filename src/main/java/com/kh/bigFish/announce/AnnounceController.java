package com.kh.bigFish.announce;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnnounceController {
	
	@RequestMapping(value="annList.an")
	public String AnnounceList() {
		return "announce/announceList";
	}
	
	@RequestMapping(value="annDetail.an")
	public String AnnDetail() {
		return "announce/announceDetail";
	}
	
	@RequestMapping(value="annInsert.an")
	public String AnnInsert() {
		return "announce/announceInsert";
	}
	
	@RequestMapping(value="annEnrollForm.an")
	public String AnnEnrollForm() {
		return "announce/announceEnroll";
	}
		
	
}
