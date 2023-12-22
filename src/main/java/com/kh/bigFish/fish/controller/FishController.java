package com.kh.bigFish.fish.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import com.kh.bigFish.announce.model.vo.Announce;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.fish.model.service.FishService;
import com.kh.bigFish.fish.model.vo.Fish;

@Controller
public class FishController {
	
	@Autowired
	private FishService fishService;
	
	@RequestMapping(value="fishInfo.fi")
	public ModelAndView fishInfoFreshList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(fishService.selectFreshListCount(), currentPage, 10, 6);
		ArrayList<Fish> fishList = fishService.selectFreshList(pi);

		for (Fish f : fishList) {
			String imgPaths = ImagePathFromContent(f.getFishContent());
			f.setFishTitleImage(imgPaths);
		}
			mv.addObject("pi",pi)
			  .addObject("list", fishList)
			  .setViewName("fishInfo/fishInfo");
		
		return mv;
	}
	
	@RequestMapping(value="fishInfoSea.fi")
	public ModelAndView fishInfoSeaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(fishService.selectSeaListCount(), currentPage, 10, 6);
		ArrayList<Fish> fishList = fishService.selectSeaList(pi);
		
		for (Fish f : fishList) {
			String imgPaths = ImagePathFromContent(f.getFishContent());
			f.setFishTitleImage(imgPaths);
			
		}
		
			mv.addObject("pi",pi)
			  .addObject("list", fishList)
			  .setViewName("fishInfo/fishInfoSea");
		
		return mv;
	 }
	
	
	@RequestMapping(value="fishInEnroll.fi")
	public String fishInfoEnroll() {
		return "fishInfo/fishInfoInsert";
	}
	
	@RequestMapping(value="fishInsert.fi")
	public String fishInfoInsert(Fish f, String deleteImgs, HttpSession session, Model model) {
		
		String[] imgs = deleteImgs.split(",");
		
		// 이미지를 저장확정 안할시 삭제한 이미지를 폴더에서 삭제하는 코드
		for (String imgPath : imgs) {
	        new File(session.getServletContext().getRealPath(imgPath)).delete();
		}
		
		int result = fishService.insertFishInfo(f);

		if((result) > 0) {
			session.setAttribute("alertMsg", "백과사전 작성완료");
			return "redirect:fishInfo.fi";
		} else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errMsg";
		}
	}
	
	@RequestMapping(value="fishUpdateForm.fi")
	public String FishUpdateForm(int fno, Model model) {
		
		model.addAttribute("f", fishService.selectFish(fno));
		
		return "fishInfo/fishInfoUpdate";
	}
	
	@RequestMapping(value="fishUpdate.fi")
	public String updateAnn(Fish f, String deleteImgs, HttpSession session, Model model) {
		
		Fish fish = fishService.selectFish(f.getFishNo());
		
	    String fishContent = fish.getFishContent();
	    String newFishContent = f.getFishContent();
	    
	    // annContent에서 이미지 파일 경로 추출
	    List<String> imgPaths = extractImgPathsFromContent(fishContent);
	    List<String> newImgPaths = extractImgPathsFromContent(newFishContent);

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
	    
	    int result = fishService.updateFish(f);
	    
	    if (result > 0) {
	        session.setAttribute("alertMsg", "게시글 수정 완료");
	        return "redirect:fishInfoDetail.fi?fno=" + f.getFishNo();
	    } else {
	        model.addAttribute("errorMsg", "게시글 수정 실패");
	        return "common/errorPage";
	    }
	}
	
	@RequestMapping(value="fishInfoDelete.fi")
	public String deleteFishInfo(int fno, HttpSession session, Model model) {
		
		Fish f = fishService.selectFish(fno);
		String fishContent = f.getFishContent();
		
	    // annContent에서 이미지 파일 경로 추출
	    List<String> imgPaths = extractImgPathsFromContent(fishContent);

	    // 파일 삭제
	    for (String imgPath : imgPaths) {
	  
	         new File(session.getServletContext().getRealPath(imgPath)).delete();
	         
	    }
		
		int result = fishService.deleteFish(fno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:fishInfo.fi";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}

	@ResponseBody
	@RequestMapping(value="/uploadFishImageFile")
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
	
	@RequestMapping(value="fishInfoDetail.fi")
	public String fishInfoDetail(int fno, Model model) {
		int result = fishService.increaseCount(fno);
		
		if(result > 0) {
			Fish f = fishService.selectFish(fno);
			model.addAttribute("f", f);			
			return "fishInfo/fishInfoDetail";
		} else {
			model.addAttribute("errorMsg", "게시글 조회 실패");
			return "common/errorPage";
		}
		
	}
	
	public static String ImagePathFromContent(String fishContent) {
		
	    int startIndex = fishContent.indexOf("<img");
	    
	    if (startIndex != -1) {
	        int srcIndex = fishContent.indexOf("src=", startIndex);
	        int startQuoteIndex = fishContent.indexOf("\"", srcIndex);
	        int endQuoteIndex = fishContent.indexOf("\"", startQuoteIndex + 1);
	        String imgPath = fishContent.substring(startQuoteIndex + 9, endQuoteIndex);
	        return imgPath;
	    }
	    return null;
	}
	
	private List<String> extractImgPathsFromContent(String fishContent) {
	    List<String> imgPaths = new ArrayList<>();

	    // 이미지 경로 추출
	    int startIndex = fishContent.indexOf("<img");

	    while (startIndex != -1) {
	        int srcIndex = fishContent.indexOf("src=", startIndex);
	        int startQuoteIndex = fishContent.indexOf("\"", srcIndex);	      
	        int endQuoteIndex = fishContent.indexOf("\"", startQuoteIndex + 1);
	        String imgPath = fishContent.substring(startQuoteIndex + 9, endQuoteIndex); // +9인 이유는 +1에다가 /bigFish라는 contextPath제거
	        imgPaths.add(imgPath);
	        startIndex = fishContent.indexOf("<img", endQuoteIndex);
	    }

	    return imgPaths;
	}
	

}
