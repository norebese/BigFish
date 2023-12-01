package com.kh.bigFish.study.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.study.model.service.StudyService;
import com.kh.bigFish.study.model.vo.Study;

@Controller
public class StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value="/list.st")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagenation.getPageInfo(studyService.selectListCount(), currentPage, 5, 5);
		
		mv.addObject("pi", pi)
		  .addObject("list", studyService.selectList(pi))
		  .setViewName("study/studyListView");
//		 System.out.println(studyService.selectList(pi));
		return mv;
	}
	
	@RequestMapping("enrollForm.st")
	public String enrollForm() {
	
		return "study/studyEnrollForm";
	}
	
	@RequestMapping(value="/insert.st")
	public String insertStudy(Study s, HttpSession session, Model model) {
		System.out.println(s);
		int result = studyService.insertStudy(s);
//		System.out.println(result);
		if (result > 0) {
			session.setAttribute("alertMsg", "게시글 작성 완료");
			return "redirect:list.st";
		} else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
//	@RequestMapping(value="/detail.st")
//	public String selectStudy(int sno, Model model) {
//		
//		int result = studyService.increaseCount(sno);
//		
//		if(result > 0) {
//			Study s = studyService.selectStudy(sno);
//			model.addAttribute("s", s);
//			
//			return "study/studyDetailView";
//		} else {
//			model.addAttribute("errorMsg", "게시글 작성 실패");
//			return "common/errorPage";
//		}
//	}
//	
//	@RequestMapping(value="/delete.st")
//	public String deleteStudy(int sno, HttpSession session, Model model) {
//		
//		int result = studyService.deleteStudy(sno);
//		if (result > 0) {
//			session.setAttribute("alertMsg", "게시글 삭제 성공");
//			return "redirect:list.st";
//		} else {
//			model.addAttribute("errorMsg", "게시글 삭제 실패");
//			return "common/errorPage";
//		}
//	}
//	
//	@RequestMapping(value="/updateForm.st")
//	public String updateForm(int sno, Model model) {
//		
//		model.addAttribute("s", studyService.selectStudy(sno));
//		
//		return "study/studyUpdateForm";
//	}
//	
//	@RequestMapping(value="update.st")
//	public String updateStudy(Study s, HttpSession session, Model model) {
//		
//		int result = studyService.updateStudy(s);
//		
//		if (result > 0) {
//			session.setAttribute("alertMsg", "게시글 수정 완료");
//			return "redirect:detail.st?sno=" + s.getStudyNo();
//		} else {
//			model.addAttribute("errorMsg", "게시글 수정 실패");
//			return "common/errorPage";
//		}
//	}
}
