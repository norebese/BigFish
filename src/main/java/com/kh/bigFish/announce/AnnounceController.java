package com.kh.bigFish.announce;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnnounceController {
	
	@RequestMapping(value="announceList.an")
	public String AnnounceList() {
		return "announce/announceList";
	}
}
