package com.kh.bigFish.study.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reply.model.vo.Reply;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.study.model.service.StudyService;
import com.kh.bigFish.study.model.vo.Study;
import com.kh.bigFish.study.model.vo.StudyGood;

@Controller
public class StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value="/list.st")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagenation.getPageInfo(studyService.selectListCount(), currentPage, 10, 5);
		
		mv.addObject("pi", pi)
		  .addObject("list", studyService.selectList(pi))
		  .setViewName("study/studyListView");
		return mv;
	}
	
	@RequestMapping("enrollForm.st")
	public String enrollForm() {
	
		return "study/studyEnrollForm";
	}
	
	@RequestMapping(value="/insert.st")
	public String insertStudy(Study s, HttpSession session, Model model) {
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
	
	@RequestMapping(value="/detail.st")
	public String selectStudy(int sno, Model model, HttpSession session, HttpServletRequest request) {
//		Member Mem = (Member) session.getAttribute("loginUser");
//		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
//		Study st = studyService.stDetailPage(studyNo);
//		StudyGood checkLikeTable = new StudyGood();
//		
//		if(Mem != null) {
//			int memNo = Mem.getPostNo();
//			
//			checkLikeTable = studyService.checkLikeTable(memNo, studyNo);
//			
//			if(checkLikeTable == null) {
//				int createLikeTable = studyService.createLikeTable(memNo, studyNo);
//			}
//		}
//		
//		session.setAttribute("StudyGood", checkLikeTable);
		
		int result = studyService.increaseCount(sno);
		
		if(result > 0) {
			Study s = studyService.selectStudy(sno);
			model.addAttribute("s", s);
			
			return "study/studyDetailView";
		} else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="/delete.st")
	public String deleteStudy(int sno, HttpSession session, Model model) {
		int result = studyService.deleteStudy(sno);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:list.st";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="/updateForm.st")
	public String updateForm(int sno, Model model) {
		
		model.addAttribute("s", studyService.selectStudy(sno));
		
		return "study/studyUpdateForm";
	}
	
	@RequestMapping(value="update.st")
	public String updateStudy(Study s, HttpSession session, Model model) {
		
		System.out.println(s);
		
		int result = studyService.updateStudy(s);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "게시글 수정 완료");
			return "redirect:detail.st?sno=" + s.getStudyNo();
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateLike")
	public void updateLike(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

		StudyGood sg = new StudyGood();
		System.out.println(sg);
		Study s = (Study) session.getAttribute("s");
		Member Mem = (Member) session.getAttribute("loginUser");
		System.out.println(Mem);
		int studyNum = s.getStudyNo();
		
		sg.setRmemNo(Mem.getMemNo());
		sg.setRstudyNo(studyNum);
		StudyGood likeResult = studyService.likeResult(sg);
		String result = null;
		
		if(likeResult.getStudyGoodStatus().equals("N")) {
			result = "Y"; 
		}else {
			result = "N";
		}
		
		int studyUpdateLike = studyService.studyUpdateLike(sg, result);
		
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 좋아요 클릭했다 뗐다 하기
		@RequestMapping("toggleLike") 
		public Map<String, Object> toggleLike(HttpSession session, Member memId) {
			
			Map<String, Object> map = new HashMap<>();
			
			Member loginUser = (Member) session.getAttribute("sessionUser");
			memId.setMemId(loginUser.getMemId());
			
			studyService.toggleLike(memId);
			
			map.put("result", "success");
			
			return map;
		}
		
		// 고객이 하나의 상품에 대하여 좋아요를 하였는지 체크
		@RequestMapping("checkLikeProductByCustomer") 
		public Map<String, Object> checkLikeProductByCustomer(HttpSession session, Member memId) {
			
			Map<String, Object> map = new HashMap<>();
			
			Member loginUser = (Member) session.getAttribute("sessionUser");
			
			if (loginUser == null) {
				map.put("result", "fail");
				map.put("reason", "로그인이 되어있지 않습니다.");
				return map;
			}
			
			memId.setMemId(loginUser.getMemId());
			
			map.put("result", "success");
			map.put("checkLikeProductByCustomer", studyService.checkLikeProductByCustomer(memId));
			
			return map;
			
		}
		
		// 상품 좋아요 개수 체크
		@RequestMapping("getTotalLikeProductId")
		public Map<String, Object> getTotalLikeProductId(int studyNo) {
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("result", "success");
			
			map.put("count", studyService.getTotalLikeProductId(studyNo));
			
			return map;
		}
	
	@RequestMapping(value="search.st")
	public ModelAndView searchStudy(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition,String keyword,ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagenation.getPageInfo(studyService.selectSearchListCount(map), currentPage, 5, 5);
		ArrayList<Study> list = studyService.selectSearchList(map, pi);
		
		mv.addObject("pi",pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("study/studyListView");
		
		return mv;
	}

	//댓글 파트
	@ResponseBody
	@RequestMapping(value="rlist.st", produces="application/json; charset=UTF-8")
	public String selectReplyList(int sno) {
		
		ArrayList<Reply> list = studyService.selectReplyList(sno);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("rinsert.st")
	public String insertReply(Reply r) {
		int result = studyService.insertReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="mainList.st", produces="application/json; charset=UTF-8")
	public String ajaxTopStudyList() {
		System.out.println("s");
		return new Gson().toJson(studyService.selectmainList());
	}
}

