package com.kh.bigFish.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQController {
	
	@RequestMapping(value="faqList.fa")
	public String faqList() {
		return "faq/faqList";
	}
	
	@RequestMapping(value="faqInsert.fa")
	public String faqInsert() {
		return "faq/faqInsert";
	}
	
	@RequestMapping(value="faqEnroll.fa")
	public String faqEnroll() {
		return "faq/faqEnroll";
	}
}
