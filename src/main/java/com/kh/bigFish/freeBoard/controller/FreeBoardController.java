package com.kh.bigFish.freeBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.freeBoard.model.service.FreeBoardService;
import com.kh.bigFish.freeBoard.model.vo.Flike;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reply.model.vo.Reply;
import com.kh.bigFish.store.model.vo.Slike;
import com.kh.bigFish.store.model.vo.Store;


@Controller
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeboardService;

	@RequestMapping("insert.fbo")
	public String insertBoard(FreeBoard b, HttpSession session, Model model) {
	  
	System.out.println(b);
		
//	   System.out.println("여기까진됩니다.");
		int result = freeboardService.insertFreeBoard(b);
		if(result>0) { //성공=> 게시글 리스트페이지로 redirect:"list.bo"
			session.setAttribute("alertMsg", "게시글 작성 완료");
			return "redirect:list.fbo";
		}else {// 실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}
	}

	@RequestMapping(value="/freeBoardList.bo")
	public String freeBoardList() {
		
		return "freeBoard/freeBoardList";
	}
	@RequestMapping(value="/freeEnrollForm.bo")
	public String freeEnrollForm() {
		
		return "freeBoard/freeBoardEnrollForm";
	}
	
	@ResponseBody
    @RequestMapping(value="/uploadSummernoteImageFile") 
    public String uploadSummernoteImageFile(MultipartFile upfile,HttpSession session) { 
		
    	
		//원래 파일명
		String originName = upfile.getOriginalFilename();
		
		//시간정보(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHss").format(new Date());
		
		//랜덤숫자 5자리
		int ranNum = (int)(Math.random() *90000) + 10000;
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//변경된 이름
		String changeName = currentTime + ranNum + ext;
		
		//첨부파일 저장할 폴더의 물리적인 경우(web이 아니라 진짜 컴퓨터 안에있는 드라아비)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return ("/resources/uploadFiles/" + changeName);
		  
	}
	
	@RequestMapping("list.fbo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
				
		PageInfo pi = Pagenation.getPageInfo(freeboardService.selectListCount(), currentPage, 5, 10);
		
		//ModelAndView는 메서드 체인(이어쓰기) 가능함
		mv.addObject("pi", pi).addObject("list", freeboardService.selectList(pi)).setViewName("freeBoard/freeBoardList");
		System.out.println(mv);
		return mv;
	}
	
	@RequestMapping("detail.fbo")
	public String selectBoard(int bno, Model model ,HttpServletRequest request, HttpSession session) {
		Member Mem = (Member) session.getAttribute("loginUser");
		int likeNo =freeboardService.freeGoodCount(bno);
		int result = freeboardService.increaseCount(bno);
	
		System.out.println("59595959"+likeNo);
		
		Flike checkLikeTable = new Flike();
		
		if(Mem != null) {
			int memNo = Mem.getMemNo();
			
			checkLikeTable = freeboardService.checkLikeTable(memNo, bno);
			System.out.println("12341234"+checkLikeTable);
			if(checkLikeTable==null) {
				int createLikeTable = freeboardService.createLikeTable(memNo, bno);
				
			}
		}
	
		if(result>0) {
			FreeBoard b = freeboardService.selectBoard(bno);
			model.addAttribute("b", b);
			 model.addAttribute("likeNo", likeNo);
			 model.addAttribute("freeGoodStatus", checkLikeTable);
			 System.out.println("모달입니다."+model);
			
			return "freeBoard/freeBoardDetailView";
		}else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}
	}
	
	
	
//	@RequestMapping("freeUpdateForm.bo")
//	public String updateForm(int bno, Model model) {
//		
//		//현재 내가 수정하기를 클릭한 게시글에 대한 정보를 가지고 이동
//		model.addAttribute("b", freeboardService.selectBoard(bno));
//		
//		
//		return "board/boardEnrollForm";
//	}
	
	@RequestMapping(value="freeUpdateForm.bo")
	public String AnnEnrollForm(int bno, Model model) {
		
		model.addAttribute("b", freeboardService.selectBoard(bno));
		
		return "freeBoard/freeBoardUpdateForm";
	}
	
	
	@RequestMapping("update.fbo")
	public String updateBoard(FreeBoard b, String filePath, HttpSession session, MultipartFile reUpfile, MultipartFile upfile, Model model) {
	
		//b객체 update
		int result = freeboardService.updateFreeBoard(b);
		
		//성공유무 확인후 페이지 리턴
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정완료");
			return "redirect:detail.fbo?bno=" + b.getFreeNo();
		}else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}
		
	}
	
	@RequestMapping("delete.fbo")
	public String deleteBoard(int bno, String filePath, HttpSession session, Model model) {
		
		int result = freeboardService.deleteBoard(bno);
		
		session.setAttribute("alertMsg", "게시글 수정완료");
			return "redirect:list.fbo";

	}
	
	@RequestMapping(value="fsearchForm.bo")
	public ModelAndView searchAnn(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition,String keyword,String originName,String changeName,ModelAndView mv) {
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("changeName",changeName);
		map.put("originName",originName);
	
		
		
		PageInfo pi = Pagenation.getPageInfo(freeboardService.selectSearchListCount(map), currentPage, 5, 10);

		ArrayList<FreeBoard> list = freeboardService.selectSearchList(map, pi);
		mv.addObject("pi",pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .addObject("changeName", changeName)
		  .addObject("originName", originName)
		  .setViewName("freeBoard/freeBoardList");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="mainList.fbo", produces="application/json; charset=UTF-8")
	public String ajaxfreeBoardList() {
		return new Gson().toJson(freeboardService.selectmainList());
	}
	
//	@ResponseBody
//	@RequestMapping("ajaxUpdateFreeLike")
//	public Map<String, Object> ajaxUpdateLike(HttpServletRequest request, HttpSession session, HttpServletResponse response, int freeNo) {
//		Map<String, Object> result1 = new HashMap<>();
//		Flike fr = new Flike();

//		Member Mem = (Member) session.getAttribute("loginUser");
//		System.out.println(Mem);
//		
//		fr.setRmemNo(Mem.getMemNo());
//		fr.setRfreeNo(freeNo);
//		System.out.println("1"+fr);
//		Flike likeResult = freeboardService.likeResult(fr);
//		System.out.println("2"+likeResult);
//
//		String result = null;
//		
//		if(likeResult.getFreeGoodStatus().equals("N")) {
//			result = "Y";
//		}else {
//			result = "N";
//		}
//		System.out.println(result);
//		int storeUpdateLike = freeboardService.freeUpdateLike(fr, result);
//		
//		try {
//			response.getWriter().print(result);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return result1;
//	}
	@ResponseBody
	@RequestMapping("ajaxUpdateFreeLike")
	public Map<String, Object> ajaxUpdateLike(HttpServletRequest request, HttpSession session, int freeNo) {
	    Map<String, Object> result = new HashMap<>();
	    Flike fr = new Flike();
	    
	    Member mem = (Member) session.getAttribute("loginUser");
	    fr.setRmemNo(mem.getMemNo());
	    fr.setRfreeNo(freeNo);
	  
	    Flike likeResult = freeboardService.likeResult(fr);
	  
	    int likeNo =freeboardService.freeGoodCount(freeNo);
	    
	    fr.setCount(likeNo);
	    System.out.println("123412344321"+fr);
	    String status = (likeResult.getFreeGoodStatus().equals("N")) ? "Y" : "N";
	    
	    int storeUpdateLike = freeboardService.freeUpdateLike(fr, status);
	    System.out.println("123412344321"+storeUpdateLike);
	    result.put("status", status);
	    
	    return result;
	}
	
	//댓글 파트
		@ResponseBody
		@RequestMapping(value="rlist.fr", produces="application/json; charset=UTF-8")
		public String selectReplyList(int bno) {
			
			ArrayList<Reply> list = freeboardService.selectReplyList(bno);
			System.out.println("99"+list);
			
			return new Gson().toJson(list);
		}
		
		@ResponseBody
		@RequestMapping("rinsert.fr")
		public String insertReply(Reply r) {
			System.out.println("12342314"+r);
			int result = freeboardService.insertReply(r);
			System.out.println(result);
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		}

	/**
	 * 
	 */
}
