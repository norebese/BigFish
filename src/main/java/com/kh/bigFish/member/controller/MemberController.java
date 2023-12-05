package com.kh.bigFish.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.member.model.service.MemberService;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.store.model.service.StoreService;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StoreService storeService;
	
	// 로그인 폼으로 이동
	@RequestMapping(value="/loginForm.me")
	public String loginForm() {
		
		return "member/login";
	}
	// 로그인 
	@RequestMapping(value="/login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser == null) {
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("common/errorPage");
		}else {
			session.setAttribute("loginUser", loginUser);
			
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	// 로그아웃
	@RequestMapping(value="/logout.me")
	public ModelAndView logoutMember(ModelAndView mv, HttpSession session) {
		session.removeAttribute("loginUser");
		
		session.setAttribute("alertMsg", "로그아웃에 성공했습니다");
		mv.setViewName("redirect:/");
		
		return mv;
	}
	// 회원가입 (개인/사업자) 선택 폼으로 이동
	@RequestMapping(value="/chooseEnroll.me")
	public String chooseEnroll() {
		return "member/chooseEnroll";
	}
	// 개인 회원가입 폼으로 이동
	@RequestMapping(value="/personalEnrollForm.me")
	public String personalEnrollForm() {
		return "member/personalEnrollForm";
	}
	// 사업자 회원가입 폼으로 이동
	@RequestMapping(value="/companyEnrollForm.me")
	public String companyEnrollForm() {
		return "member/companyEnrollForm";
	}
	// 개인 회원 마이페이지로 이동
	@RequestMapping(value="/personalMyPage.me")
	public String personalMyPage() {
		return "member/personalMyPage";
	}
	// 사업자 회원 관리페이지로 이동
	@RequestMapping(value="/companyMyPage.me")
	public String companyMyPage() {
		return "member/companyMyPage";
	}
	// 개인 회원 예약 목록 자세히 보기로 이동
	@RequestMapping(value="/myReservationDetail")
	public String myReservationDetail() {
		return "member/myReservationDetail";
	}
	
	
	// 아이디(이메일) 중복체크
	@ResponseBody
	@RequestMapping("/checkEmailId")
	public String checkEmailId(String emailId) {
		int result = memberService.checkEmailId(emailId);
		
		if(result>0) {
			// 해당 이메일 사용 불가 (같은 이메일 있음)
			return "N";
		}else {
			// 해당 이메일 사용 가능 (같은 이메일 없음)
			return "Y";
		}
	}
	
	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping("/checkNick")
	public String checkNick(String memNick) {
		
		int result = memberService.checkNick(memNick);
		
		if(result>0) {
			// 해당 닉네임 사용 불가 (같은 닉네임 있음)
			return "N";
		}else {
			// 해당 닉네임 사용 가능 (같은 닉네임 없음)
			return "Y";
		}
		
	}
	
	// 개인 회원가입
	@RequestMapping("/insertPersonalMember.me")
	public String insertPersonalMember(Member m, Model model, HttpSession session) {

		int result = memberService.insertPersonalMember(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입에 성공했습니다.");
			
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 사업자 회원 가입
	// 자바스크립트 단에서 i를 이용해 가공하는 방식으로 변경해야함
	// 배열인 상태로 네임을 받아서 네임 길이 재서 그 길이에 따라 클릭될때마다 값을 저장하는 형식
	// const i = document.querySelectorAll(".fishTicketName").length;
	
	@RequestMapping("/insertCompanyMember.me")
	public String insertCompanyMember(Member m, Store s ,String[] StoreFishKindArray,
										String[] ticketNameArray, int[] ticketPriceArray, int[] ticketTimeArray, 
										String[] storeWeekdayArray, String[] storeWeekendArray,
										HttpSession session, MultipartFile[] upfile, Model model) {
		
		
		ArrayList<Attachment> attArray = new ArrayList<Attachment>();
		ArrayList<Ticket> ticArray = new ArrayList<Ticket>();
		
		s.setStoreWeekday(String.join(" ~ ", storeWeekdayArray));
		s.setStoreWeekend(String.join(" ~ ", storeWeekendArray));
		s.setStoreFishKind(String.join("/", StoreFishKindArray));
		
		for(int i=0; i<ticketNameArray.length; i++) {
			Ticket tic = new Ticket();
			
			tic.setTicketName(ticketNameArray[i]);
			tic.setTicketPrice(ticketPriceArray[i]);
			tic.setTicketTime(ticketTimeArray[i]);
			
			ticArray.add(tic);
		}
		

		
		for(MultipartFile fi : upfile) {
			String changeName = saveFile(fi, session,"/resources/uploadFiles/");
			//해당 객체 객체배열에 set 해줘야함
			
			Attachment att = new Attachment();
			att.setOriginName(fi.getOriginalFilename());
			att.setChangeName(changeName);
			att.setFilePath(session.getServletContext().getRealPath("/resources/uploadFiles/"));
			
			attArray.add(att);
		}
		
		
		
		
		int memberResult = memberService.insertCompanyMember(m);
		
		if(memberResult>0) {
			// 회원 정보 삽입 성공
			
			// Store 삽입
			storeService.insertStore(s);
			
			// Ticket 삽입
			for(Ticket t : ticArray) {
				storeService.insertTicket(t);
			}
			
			// Attachment 삽입
			for(Attachment a : attArray) {
				storeService.insertAttachment(a);
			}
			
			session.setAttribute("alertMsg", "회원가입에 성공했습니다.");
			return "redirect:/";	
			
		}else {
		   // 회원 정보 삽입 실패
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}	
		
		
	}
	
	
	
	
	
	// 파일 이름 변경용 메서드
	public String saveFile(MultipartFile upfile, HttpSession session, String path) {
		//파일명 수정 후 서버 업로드 시키기("이미지저장용 (2).jpg" => 20231109102712345.jpg)
		//년월일시분초 + 랜덤숫자 5개 + 확장자
		
		//원래 파일명
		String originName = upfile.getOriginalFilename();
		
		//시간정보 (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//랜덤숫자 5자리
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf(".")+1);
		
		//변경된이름
		String changeName = currentTime + ranNum +"."+ ext;
		
		//첨부파일 저장할 폴더의 물리적인 경우
		String savePath = session.getServletContext().getRealPath(path);
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 휴대폰 번호 변경
	@RequestMapping("/updatePhone.me")
	public String updatePhone(Member m, Model model, HttpSession session) {
		
	
		int result = memberService.updatePhone(m);
		if(result>0) {
			// 휴대폰 번호 변경 성공
			Member loginUser = memberService.takeUserInfo(m);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "정보변경에 성공했습니다.");
			return "redirect:/personalMyPage.me";	
			
		}else {
		   // 휴대폰 번호 변경 실패
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
		
	}
	
	// 닉네임 변경
	@RequestMapping("/updateNick.me")
	public String updateNick(Member m, Model model, HttpSession session) {
		
		int result = memberService.updateNick(m);
		
		if(result>0) {
			// 닉네임 변경 성공
			Member loginUser = memberService.takeUserInfo(m);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "정보변경에 성공했습니다.");
			return "redirect:/personalMyPage.me";	
			
		}else {
		   // 닉네임 변경 실패
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 주소 변경
	@RequestMapping("/updateAddress.me")
	public String updateAddress(Member m, Model model, HttpSession session) {
		
		int result = memberService.updateAddress(m);
		
		if(result>0) {
			// 닉네임 변경 성공
			Member loginUser = memberService.takeUserInfo(m);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "정보변경에 성공했습니다.");
			return "redirect:/personalMyPage.me";	
			
		}else {
		   // 닉네임 변경 실패
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
}
