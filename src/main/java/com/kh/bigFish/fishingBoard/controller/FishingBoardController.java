package com.kh.bigFish.fishingBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.fishingBoard.model.service.FishingBoardService;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;
import com.kh.bigFish.member.model.vo.Member;

@Controller
public class FishingBoardController {

	@Autowired
	private FishingBoardService fishingBoardService;

	@RequestMapping("list.fibo")
	public String fishingBoardList() {

		//		PageInfo pi = Pagenation.getPageInfo(fishboardService.selectListCount(), currentPage, 10, 5);
		//		
		//		//ModelAndView는 메서드 체인(이어쓰기) 가능함
		//		mv.addObject("pi", pi).addObject("list", fishboardService.selectList(pi)).setViewName("freeBoard/freeBoardList");
		//		System.out.println(mv);
		return "fishingBoard/fishingBoardEnrollForm";
	}

	@ResponseBody
	@RequestMapping(value="/fishinguploadImageFile") 
	public String fishinguploadImageFile(MultipartFile upfile,HttpSession session) { 


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
	@ResponseBody
	@RequestMapping(value="/fishinguploadSummernoteImageFile") 
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

	@RequestMapping("insert.fibo")
	public String insertBoard(FishingBoard b, MultipartFile upfile, HttpSession session, Model model) {
		//				System.out.println(b);
		//			System.out.println(upfile);
		Member Mem = (Member) session.getAttribute("loginUser");
		String changeName = saveFile(upfile, session);


		Attachment at = new Attachment();
		b.setRmemNo(Mem.getMemNo());	
		at.setOriginName(upfile.getOriginalFilename());
		at.setChangeName("resources/uploadFiles/"+changeName);



		int result = fishingBoardService.insertFishingBoard(b);
		int result1 = fishingBoardService.insertFishingBoardFile(at);
		if((result*result1)>0) { //성공=> 게시글 리스트페이지로 redirect:"list.bo"

			session.setAttribute("alertMsg", "게시글 작성 완료");
			return "redirect:list.fibo";
		}else {// 실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}


	}

	//원래는 common폴더에 static으로 따로 빼줘야한다, controller에도 함수 만들어 쓸 수 있는거 보여주는 거 
	public String saveFile(MultipartFile upfile, HttpSession session) {
		//파일명 수정 후 서버 업로드 시키기(ex-"이미지저장용(2).jpg => 20231109102712345.jpg)
		//년월일시분초 + 렌덤숫자 5개 + 확장자

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

		return changeName;
	}
}


