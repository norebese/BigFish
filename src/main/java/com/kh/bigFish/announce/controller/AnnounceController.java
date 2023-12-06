package com.kh.bigFish.announce.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.announce.model.service.AnnService;
import com.kh.bigFish.announce.model.vo.Announce;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;

@Controller
public class AnnounceController {
	
	@Autowired
	private AnnService annService;
	
	@RequestMapping(value="annList.an")
	public ModelAndView AnnounceList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(annService.selectListCount(), currentPage, 10, 5);
		
			mv.addObject("pi",pi)
			  .addObject("list", annService.selectList(pi))
			  .setViewName("announce/announceList");
		
		return mv;
	}
	
	@RequestMapping(value="annDetail.an")
	public String AnnDetail(int ano, Model model) {
		int result = annService.increaseCount(ano);
		
		if(result > 0) {
			Announce a = annService.selectAnnounce(ano);
			model.addAttribute("a", a);			
			return "announce/announceDetail";
		} else {
			model.addAttribute("errorMsg", "게시글 조회 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="annEnroll.an")
	public String AnnEnroll() {
		return "announce/announceInsert";
	}
	
	@RequestMapping(value="annInsert.an")
	public String AnnInsert(Announce a, HttpSession session, Model model) {;
				
		int annResult = annService.InsertAnn(a);
		
		if (annResult > 0) {					
			session.setAttribute("alertMsg", "게시글 작성 완료");
			return "redirect:annList.an";
		} else { //실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}
	}
	
	@RequestMapping(value="annUpdateForm.an")
	public String AnnEnrollForm(int ano, Model model) {
		
		model.addAttribute("a", annService.selectAnnounce(ano));
		
		return "announce/announceEnroll";
	}
	
	@RequestMapping(value="annUpdate.an")
	public String updateAnn(Announce a, HttpSession session, Model model) {
		
		int result = annService.updateAnnounce(a);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 수정 완료");
			return "redirect:annDetail.an?ano=" + a.getAnnNo();
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="annDelete.an")
	public String deleteAnn(int ano, HttpSession session, Model model) {
		int result = annService.deleteAnn(ano);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:annList.an";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="searchAnn.an")
	public ModelAndView searchAnn(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition,String keyword,ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagenation.getPageInfo(annService.selectSearchListCount(map), currentPage, 10, 5);
		ArrayList<Announce> list = annService.selectSearchList(map, pi);
		
		mv.addObject("pi",pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("announce/announceList");
		
		return mv;
	}
	
		@ResponseBody
		@RequestMapping(value="/uploadImageFile")
		public String saveFile(MultipartFile upfile,HttpSession session, String path) {

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
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return ("/resources/uploadFiles/" + changeName);

		}

}
