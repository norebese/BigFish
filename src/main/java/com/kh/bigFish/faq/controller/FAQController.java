package com.kh.bigFish.faq.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.faq.model.service.FAQService;
import com.kh.bigFish.faq.model.vo.FAQ;

@Controller
public class FAQController {
	
	@Autowired
	private FAQService faqService;
	
	@RequestMapping(value="faqList.fa")
	public ModelAndView faqList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(faqService.selectListCount(), currentPage, 10, 5);
		
		mv.addObject("pi", pi)
		  .addObject("list", faqService.selectList(pi))
		  .setViewName("faq/faqList");
		
		return mv;
	}
	
	@RequestMapping(value="faqInsertForm.an")
	public String faqInsertForm() {
		return "faq/faqInsert";
	}
	
	@RequestMapping(value="faqInsert.fa")
	public String faqInsert(FAQ f, HttpSession session, Model model) {
		int result = faqService.faqInsert(f);
		
		
		if (result > 0) { 
			session.setAttribute("alertMsg", "게시글 작성 완료");
			return "redirect:faqList.fa";
		} else { 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}
		
	}
	
	@RequestMapping(value="faqEnrollForm.fa")
	public String faqEnrollForm(int fno, Model model) {
		
		model.addAttribute("f", faqService.selectFaq(fno));
		
		return "faq/faqEnroll";
	}
	
	@RequestMapping(value="faqUpdate.fa")
	public String faqUpdate(FAQ f,HttpSession session, Model model) {
	int result = faqService.updateFaq(f);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 수정 완료");
			return "redirect:faqList.fa";
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="faqDelete.fa")
	public String faqDelete(int fno, HttpSession session, Model model) {
		int result = faqService.faqDelete(fno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:faqList.fa";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
}
