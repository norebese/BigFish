package com.kh.bigFish.fishingBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.fishingBoard.model.service.FishingBoardService;
import com.kh.bigFish.fishingBoard.model.vo.FiLike;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;
import com.kh.bigFish.freeBoard.model.vo.Flike;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reply.model.vo.Reply;

@Controller
public class FishingBoardController {

	@Autowired
	private FishingBoardService fishingBoardService;

	
//	@RequestMapping(value="/list.fibo")
//	public String freeBoardList() {
//		
//		return "fishingBoard/fishingBoardDetailView";
//	}
	
	@RequestMapping("list.fibo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
				
		PageInfo pi = Pagenation.getPageInfo(fishingBoardService.selectListCount(), currentPage, 10, 9);
		System.out.println("12341234"+pi+"1253532151235"+mv);
		
		//ModelAndView는 메서드 체인(이어쓰기) 가능함
		mv.addObject("pi", pi).addObject("list", fishingBoardService.selectList(pi)).setViewName("fishingBoard/fishingBoardList");
		System.out.println(mv);
		return mv;
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
		at.setChangeName("/resources/uploadFiles/"+changeName);



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
	
	
	
	@RequestMapping("detail.fibo")
	public String selectBoard(int bno, Model model, HttpSession session) {
		Member Mem = (Member) session.getAttribute("loginUser");
		int likeNo =fishingBoardService.fishGoodCount(bno);
		int result = fishingBoardService.increaseCount(bno);
		
		FiLike checkLikeTable = new FiLike();
		if(Mem != null) {
			int memNo = Mem.getMemNo();
			
			checkLikeTable = fishingBoardService.checkLikeTable(memNo, bno);
			System.out.println(likeNo+"12341234"+checkLikeTable);
			if(checkLikeTable==null) {
				int createLikeTable = fishingBoardService.createLikeTable(memNo, bno);
				
			}
		}
		
		
		if(result>0) {
			FishingBoard b = fishingBoardService.selectBoard(bno);
			System.out.println("1234바보"+b);
			model.addAttribute("b", b);
			 model.addAttribute("likeNo", likeNo);
			 model.addAttribute("fishingGoodStatus", checkLikeTable);
			
			
			return "fishingBoard/fishingBoardDetailView";
		}else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}
	}
	
	@RequestMapping("enrollForm.fibo")
	public String enrollForm() {
		return "fishingBoard/fishingBoardEnrollForm";
	}
	
	
	@RequestMapping("fishingUpdateForm.fibo")
	public String updateBoard(FishingBoard b, String filePath, HttpSession session, MultipartFile reUpfile, MultipartFile upfile, Model model) {
		
		
		
		//새로운 첨부파일 존재유무확인
		if(!reUpfile.getOriginalFilename().equals("")) {
			//새로운 첨부파일 서버 업로드
			String changeName = saveFile(reUpfile, session);
			
			//새로운 첨부파일 있다면 => 기존 첨부파일 삭제
			if(b.getOriginName() != null) {
			new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			
			//b객체에 새로운 첨부파일 정보(원본명, 저장경로) 저장
			b.setOriginName(reUpfile.getOriginalFilename());
			b.setChangeName("/resources/uploadFiles/"+changeName);
		}
		//b객체 update
		int result1 = fishingBoardService.updateBoard(b);
		int result2 = fishingBoardService.updateFileBoard(b);
		
		//성공유무 확인후 페이지 리턴
		if((result1*result2)>0) {
			session.setAttribute("alertMsg", "게시글 수정완료");
			return "redirect:detail.fibo?bno=" + b.getFishingNo();
		}else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorMsg";
		}
		
	}
	@RequestMapping(value="fishingUpdateForm.bo")
	public String AnnEnrollForm(int bno, Model model) {
		
		model.addAttribute("b", fishingBoardService.selectBoard(bno));
		
		return "fishingBoard/fishingBoardUpdateForm";
	}
	
	@RequestMapping("delete.fibo")
	public String deleteBoard(int bno, String filePath, HttpSession session, Model model) {
		
		int result = fishingBoardService.deleteBoard(bno);
		
		session.setAttribute("alertMsg", "게시글 수정완료");
			return "redirect:list.fibo";

	}
	
	@RequestMapping(value="fisearchForm.bo")
	public ModelAndView searchAnn(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition,String keyword,String originName,String changeName,ModelAndView mv) {
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("changeName",changeName);
		map.put("originName",originName);
		
		
		PageInfo pi = Pagenation.getPageInfo(fishingBoardService.selectSearchListCount(map), currentPage, 5, 9);
		ArrayList<FishingBoard> list = fishingBoardService.selectSearchList(map, pi);
		System.out.println(list);
		mv.addObject("pi",pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .addObject("changeName", changeName)
		  .addObject("originName", originName)
		  .setViewName("fishingBoard/fishingBoardList");
		
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="mainList.fibo", produces="application/json; charset=UTF-8")
	public String ajaxTopBoardList() {
		return new Gson().toJson(fishingBoardService.selectmainList());
	}
	//좋아요
	@ResponseBody
	@RequestMapping("ajaxUpdateFishingLike")
	public Map<String, Object> ajaxUpdateLike(HttpServletRequest request, HttpSession session, int fishingNo) {
	    Map<String, Object> result = new HashMap<>();
	    FiLike fi = new FiLike();
	    
	    Member mem = (Member) session.getAttribute("loginUser");
	    fi.setRmemNo(mem.getMemNo());
	    fi.setRfishingNo(fishingNo);
	 
	    System.out.println("여기좀보소1234"+fi);
	    FiLike likeResult = fishingBoardService.likeResult(fi);
	    System.out.println("여기좀보소"+likeResult);
	
	    String status = (likeResult.getFishingGoodStatus().equals("N")) ? "Y" : "N";
	    
	    int storeUpdateLike = fishingBoardService.fishUpdateLike(fi, status);
	    int storeUpdateCount = fishingBoardService.fishUpdateLike1(fi);
	    System.out.println(fi+"에프알 찍는거"+status);
	    result.put("status", status);
	    result.put("likeCount", storeUpdateCount);
	    System.out.println(result+"에프알 찍는거1234");
	    return result;
	}
	//댓글 파트
			@ResponseBody
			@RequestMapping(value="rlist.fi", produces="application/json; charset=UTF-8")
			public String selectReplyList(int bno) {
			
				ArrayList<Reply> list = fishingBoardService.selectReplyList(bno);
			
				
				return new Gson().toJson(list);
			}
			
			@ResponseBody
			@RequestMapping("rinsert.fi")
			public String insertReply(Reply r) {
				System.out.println("1234"+r);
				int result = fishingBoardService.insertReply(r);
				System.out.println(result);
				if(result > 0) {
					return "success";
				} else {
					return "fail";
				}
			}
			
			
			
			
}



