package com.kh.bigFish.announce.controller;

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

import com.kh.bigFish.announce.model.service.AnnService;
import com.kh.bigFish.announce.model.vo.Announce;
import com.kh.bigFish.attachment.model.vo.Attachment;
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
	public String AnnInsert(Announce a, HttpSession session, Model model, MultipartFile upFile) {
		System.out.println(a);
		System.out.println(upFile);
		int result = annService.InsertAnn(a);
		
		Attachment at = null;
		
		//전달된 파일이 있을경우 => 파일명 수정 후 서버 업로드 => 원본명, 서버업로드된 경로로 a에 담기(파일이 있을때만)
		if(!upFile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upFile, session, "/resources/uploadFiles/");
			
			at = new Attachment();
			
			at.setOriginName(upFile.getOriginalFilename());
			at.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		if (result > 0) { 
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
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String saveFile(MultipartFile upFile, HttpSession session, String path)  {

				String originName = upFile.getOriginalFilename();
				
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				
				int ranNum = (int)(Math.random() * 90000) + 10000;
				
				String ext = originName.substring(originName.lastIndexOf("."));
								
				String changeName = currentTime + ranNum + ext;
				
				String savePath = session.getServletContext().getRealPath(path);
				
				try {
					upFile.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				return changeName;
	
	}
		
	
}
