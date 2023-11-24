package com.kh.bigFish.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.member.model.service.MemberService;
import com.kh.bigFish.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="/loginForm.me")
	public String loginForm() {
		
		return "member/login";
	}
	
	@RequestMapping(value="/login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser == null) {
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("common/errorPage");
		}else {
			session.setAttribute("loginUser", loginUser);
			
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
}
