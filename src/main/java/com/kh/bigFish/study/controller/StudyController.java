package com.kh.bigFish.study.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
	public String selectStudy(int sno, Model model, HttpSession session) {
		
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
	
	@RequestMapping("UpdateLike")
	public void updateLike(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

		StudyGood sg = new StudyGood();
		System.out.println(sg);
		Study st = (Study) session.getAttribute("st");
		Member Mem = (Member) session.getAttribute("loginUser");
		int studyNum = st.getStudyNo();
		
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
	
	/*
	@PostMapping("/like.st")
	@ResponseBody
	public String updateGood(@RequestBody StudyGood studyGoodStatus) {
		// JSON으로 값이 들어오기 때문에 @RequestBody와 커맨드 객체를 사용해서 JSON 타입을 객첼 변경 
		System.out.println("/snsBoard/like : POST ");
		System.out.println("좋아요 기능 값을 가져오는지 확인 : " + studyGoodStatus);
		
		// 좋아요 버튼은 버튼이 하나임으로 버튼을 클릭 유무에 따라 좋아요 선택 및 취소를 뜻
		
		int result = studyService.searchGood(studyGoodStatus);
		// 좋아요를 눌렀다면 1이 오고 좋아요를 누르지 않았다면 0이 옴 
		
		if(result == 0) {
			// 좋아요를 누르지 않았다면 해당 정보를 db에 저장 
			studyService.createLike(studyGoodStatus);
			return "like";
		}
		else {
			// 좋아요를 눌렀으므로 db에서 해당 값 삭제 
			studyService.deleteLike(studyGoodStatus);
			return "delete";
		}
	}
	*/
	
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
}
