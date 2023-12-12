package com.kh.bigFish.freeBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.freeBoard.model.service.FreeBoardService;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;


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
				
		PageInfo pi = Pagenation.getPageInfo(freeboardService.selectListCount(), currentPage, 10, 5);
		
		//ModelAndView는 메서드 체인(이어쓰기) 가능함
		mv.addObject("pi", pi).addObject("list", freeboardService.selectList(pi)).setViewName("freeBoard/freeBoardList");
		System.out.println(mv);
		return mv;
	}
	
	@RequestMapping("detail.fbo")
	public String selectBoard(int bno, Model model) {
	
		int result = freeboardService.increaseCount(bno);
	
		if(result>0) {
			FreeBoard b = freeboardService.selectBoard(bno);
			model.addAttribute("b", b);
			
			
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
	
}
