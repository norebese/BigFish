package com.kh.bigFish.announce.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	public String AnnInsert(Announce a, String deleteImgs, HttpSession session, Model model) {;
		
		// 이미지를 저장확정 안할시 삭제한 이미지를 폴더에서 삭제하는 코드
		String[] imgs = deleteImgs.split(",");

		 for (String imgPath : imgs) {
		        new File(session.getServletContext().getRealPath(imgPath)).delete();
		}
			
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
	public String updateAnn(Announce a, String deleteImgs, HttpSession session, Model model) {
		
		Announce ann = annService.selectAnnounce(a.getAnnNo());
		
	    String annContent = ann.getAnnContent();
	    String newAnnContent = a.getAnnContent();
	    
	    // annContent에서 이미지 파일 경로 추출
	    List<String> imgPaths = extractImgPathsFromContent(annContent);
	    List<String> newImgPaths = extractImgPathsFromContent(newAnnContent);
	    System.out.println(deleteImgs);
	    // 이미지를 저장확정 안할시 삭제한 이미지를 폴더에서 삭제하는 코드
	    String[] imgs = deleteImgs.split(",");
	    for (String imgPath : imgs) {
	        new File(session.getServletContext().getRealPath(imgPath)).delete();
	    }
	    
	    // 파일 삭제
	    for (String imgPath : imgPaths) {
	    	if (newImgPaths.indexOf(imgPath) == -1) {
	            new File(session.getServletContext().getRealPath(imgPath)).delete();
	        }
	    }
	    
	    int result = annService.updateAnnounce(a);
	    
	    if (result > 0) {
	        session.setAttribute("alertMsg", "게시글 수정 완료");
	        return "redirect:annDetail.an?ano=" + a.getAnnNo();
	    } else {
	        model.addAttribute("errorMsg", "게시글 수정 실패");
	        return "common/errorPage";
	    }
	}
	
	@RequestMapping(value="annDelete.an")
	public String deleteAnn(int ano, HttpSession session, Model model) {
		
		Announce ann = annService.selectAnnounce(ano);
		String annContent = ann.getAnnContent();
		
	    // annContent에서 이미지 파일 경로 추출
	    List<String> imgPaths = extractImgPathsFromContent(annContent);

	    // 파일 삭제
	    for (String imgPath : imgPaths) {
	  
	         new File(session.getServletContext().getRealPath(imgPath)).delete();
	         
	    }
		
		int result = annService.deleteAnn(ano);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:annList.an";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	private List<String> extractImgPathsFromContent(String annContent) {
	    List<String> imgPaths = new ArrayList<>();

	    // 이미지 경로 추출
	    int startIndex = annContent.indexOf("<img");

	    while (startIndex != -1) {
	        int srcIndex = annContent.indexOf("src=", startIndex);
	        int startQuoteIndex = annContent.indexOf("\"", srcIndex);	      
	        int endQuoteIndex = annContent.indexOf("\"", startQuoteIndex + 1);
	        String imgPath = annContent.substring(startQuoteIndex + 9, endQuoteIndex); // +9인 이유는 +1에다가 /bigFish라는 contextPath제거
	        imgPaths.add(imgPath);
	        startIndex = annContent.indexOf("<img", endQuoteIndex);
	    }

	    return imgPaths;
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
		public String saveFile(MultipartFile upfile, HttpSession session, String path) {

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
			
			changeName = "/resources/uploadFiles/" + changeName;
			return changeName;
			
		}
		
		
}
