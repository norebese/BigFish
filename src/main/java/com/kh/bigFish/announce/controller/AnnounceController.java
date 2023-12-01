package com.kh.bigFish.announce.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
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
	public String AnnInsert(Announce a, HttpSession session, Model model) {
		int result = annService.InsertAnn(a);
		
		if (result > 0) { 
			session.setAttribute("alertMsg", "게시글 작성 완료");
			return "redirect:annList.an";
		} else { //실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}
	}
	
	@RequestMapping(value="annUpdate.an")
	public String AnnEnrollForm() {
		return "announce/announceEnroll";
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
		
	
}
