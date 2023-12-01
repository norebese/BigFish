package com.kh.bigFish.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.member.model.service.MemberService;
import com.kh.bigFish.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 폼으로 이동
	@RequestMapping(value="/loginForm.me")
	public String loginForm() {
		
		return "member/login";
	}
	// 로그인 
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
	// 로그아웃
	@RequestMapping(value="/logout.me")
	public ModelAndView logoutMember(ModelAndView mv, HttpSession session) {
		session.removeAttribute("loginUser");
		
		session.setAttribute("alertMsg", "로그아웃에 성공했습니다");
		mv.setViewName("redirect:/");
		
		return mv;
	}
	// 회원가입 (개인/사업자) 선택 폼으로 이동
	@RequestMapping(value="/chooseEnroll.me")
	public String chooseEnroll() {
		return "member/chooseEnroll";
	}
	// 개인 회원가입 폼으로 이동
	@RequestMapping(value="/personalEnrollForm.me")
	public String personalEnrollForm() {
		return "member/personalEnrollForm";
	}
	// 사업자 회원가입 폼으로 이동
	@RequestMapping(value="/companyEnrollForm.me")
	public String companyEnrollForm() {
		return "member/companyEnrollForm";
	}
	// 개인 회원 마이페이지로 이동
	@RequestMapping(value="/personalMyPage.me")
	public String personalMyPage() {
		return "member/personalMyPage";
	}
	// 사업자 회원 관리페이지로 이동
	@RequestMapping(value="/companyMyPage.me")
	public String companyMyPage() {
		return "member/companyMyPage";
	}
	// 개인 회원 예약 목록 자세히 보기로 이동
	@RequestMapping(value="/myReservationDetail")
	public String myReservationDetail() {
		return "member/myReservationDetail";
	}
	
	
	// 아이디(이메일) 중복체크
	@ResponseBody
	@RequestMapping("/checkEmailId")
	public String checkEmailId(String emailId) {
		int result = memberService.checkEmailId(emailId);
		
		if(result>0) {
			// 해당 이메일 사용 불가 (같은 이메일 있음)
			return "N";
		}else {
			// 해당 이메일 사용 가능 (같은 이메일 없음)
			return "Y";
		}
	}
	
	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping("/checkNick")
	public String checkNick(String memNick) {
		System.out.println(memNick);
		int result = memberService.checkNick(memNick);
		
		if(result>0) {
			// 해당 닉네임 사용 불가 (같은 닉네임 있음)
			return "N";
		}else {
			// 해당 닉네임 사용 가능 (같은 닉네임 없음)
			return "Y";
		}
		
	}
	
	// 개인 회원가입
	@RequestMapping("/insertPersonalMember.me")
	public String insertPersonalMember(Member m, Model model, HttpSession session) {

		int result = memberService.insertPersonalMember(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입에 성공했습니다.");
			
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
		
		
	}
	
	
}
