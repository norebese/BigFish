package com.kh.bigFish.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.study.model.service.StudyService;

@Controller
public class StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value="/list.st")
	public String selectList() {
	
		return "study/studyListView";
	}
	
	@RequestMapping(value="/enrollForm.st")
	public String enrollForm() {
	
		return "study/studyEnrollForm";
	}
	
	@RequestMapping(value="/detail.st")
	public String selectStudy() {
		
		return "study/studyDetailView";
	}
	
	@RequestMapping(value="/delete.st")
	public String deleteStudy() {
		
		return "redirect:list.st";
	}
	
	@RequestMapping(value="/updateForm.st")
	public String updateForm() {
		
		return "study/studyUpdateForm";
	}
}
