package com.kh.bigFish.member.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.member.model.service.MemberService;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reservation.model.service.ReservationService;
import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.service.StoreService;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StoreService storeService;
	
	// 메일관련
	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private ReservationService reservationService;
	

	
	
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
	// 메인으로
	@RequestMapping(value="/goMain.me")
	public String goMain() {
		return "redirect:/";
	}
	// 회원가입 (개인/사업자) 선택 폼으로 이동
	@RequestMapping(value="/chooseEnroll.me")
	public String chooseEnroll() {
		return "member/chooseEnroll";
	}
	// 네이버 개인 회원가입 폼으로 이동
	@RequestMapping(value="/personalEnrollForm.me")
	public String personalEnrollForm(HttpSession session, Model model) {
		
		
		String result = (String)session.getAttribute("res");
		
		JsonObject totalObj = JsonParser.parseString(result).getAsJsonObject();
//		System.out.println(totalObj);
//		
//		System.out.println(totalObj.get("access_token"));
//		System.out.println(totalObj.get("access_token").getAsString());
//		System.out.println(totalObj.get("refresh_token"));
//		System.out.println(totalObj.get("token_type"));
//		System.out.println(totalObj.get("expires_in"));
		
		
		// 회원 정보 받기
		
		String token = totalObj.get("access_token").getAsString(); // 액세스토큰
		String header = "Bearer "+token;
		
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		
		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("Authorization", header);
		
		String responseBody = get(apiURL,requestHeaders);
		
		
		
		JsonObject memberInfo =  JsonParser.parseString(responseBody).getAsJsonObject();
		JsonObject resObj = memberInfo.getAsJsonObject("response");
		
		
		
		Member isMember = memberService.checkMember(resObj.get("email").getAsString());
		System.out.println(isMember);
		
		if(isMember != null) {
			Member loginUser = memberService.loginMember(isMember);
			
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}
		
		session.setAttribute("memberInfo", responseBody);
		
		
		
		return "member/personalEnrollForm";
	}
	
	// 개인 회원가입 폼으로 이동
	@RequestMapping(value="/basicPersonalEnrollForm.me")
	public String basicPersonalEnrollForm() {
		return "member/basicPersonalEnrollForm";
	}
	
	
	
	
    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
	
	private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
	
    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
	
	
	// 사업자 회원가입 폼으로 이동
	@RequestMapping(value="/companyEnrollForm.me")
	public String companyEnrollForm() {
		return "member/companyEnrollForm";
	}
	// 개인 회원 마이페이지로 이동
	@RequestMapping(value="/personalMyPage.me")
	public String personalMyPage(HttpSession session,Model model) {
		
		Member loginUser =  (Member)session.getAttribute("loginUser");
		ArrayList<Reservation> reserList = reservationService.selectReservationList(loginUser.getMemNo());
		
		
		
		session.setAttribute("loginUser", loginUser);
		model.addAttribute("reserList",reserList);
		
		
		return "member/personalMyPage";
	}
	
	// 사업자 회원 관리페이지로 이동
	@RequestMapping(value="/companyMyPage.me")
	public String companyMyPage(HttpSession session, Model model) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Store> storeList = storeService.selectMyStoreList(loginUser.getMemNo());
		
		session.setAttribute("loginUser", loginUser);
		model.addAttribute("storeList", storeList);

		
		return "member/companyMyPage";
	}
	// 개인 회원 예약 목록 자세히 보기로 이동
	@RequestMapping(value="/myReservationDetail")
	public String myReservationDetail(int revNo, Model model) {
		
		Reservation rev = reservationService.getReservationService(revNo);
		Store store = storeService.getStoreInfo(rev.getRstoreNo());
		
		model.addAttribute("rev",rev);
		model.addAttribute("store",store);
		
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
	
	
	
	// 네이버 로그인
	@RequestMapping("/naverLogin.me")
	public String naverLogin() {
	
		return "member/navercallback";
		
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
	
	// 프로필 사진 변경
	@ResponseBody
	@RequestMapping("profileImgAreaChange")
	public String profileImgAreaChange(@RequestParam("memNo") int memNo,
									   @RequestParam("memChangeName") String memChangeName,
									   @RequestPart("profileImg") MultipartFile profileImg,
									   HttpSession session, Model model) {
		// 파일이 저장됨
		String changeName = saveFile(profileImg, session,"resources/uploadFiles/");
		
		
		// 저장된 경로 및 파일이름, 멤버 고유번호 객체 세팅
		Member m = new Member();
		m.setMemNo(memNo);
		m.setMemChangeName("resources/uploadFiles/"+changeName);
		
		// 저장된 경로 및 파일이름 DB 접근하여 변경
		int result = memberService.profileImgAreaChange(m);
		
		if(result>0) {
			// 변경 성공
			Member loginUser = memberService.takeUserInfo(m);
			
			new File(session.getServletContext().getRealPath(memChangeName)).delete();
			
			System.out.println(loginUser.getMemChangeName());
			return loginUser.getMemChangeName();	
		}else {
			// 변경 실패
			model.addAttribute("errorMsg","주소 변경 실패");
			return "common/errorPage";
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
	
	// 개인 휴대폰 번호 변경
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
			model.addAttribute("errorMsg","휴대폰 번호 변경 실패");
			return "common/errorPage";
		}
		
	}
	
	// 사업자 휴대폰 번호 변경
	@RequestMapping("/companyUpdatePhone.me")
	public String companyUpdatePhone(Member m, Model model, HttpSession session) {
		
	
		int result = memberService.updatePhone(m);
		if(result>0) {
			// 휴대폰 번호 변경 성공
			Member loginUser = memberService.takeUserInfo(m);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "정보변경에 성공했습니다.");
			return "redirect:/companyMyPage.me";	
			
		}else {
		   // 휴대폰 번호 변경 실패
			model.addAttribute("errorMsg","휴대폰 번호 변경 실패");
			return "common/errorPage";
		}
		
	}
	
	// 개인 닉네임 변경
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
			model.addAttribute("errorMsg","닉네임 변경 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 사업자 닉네임 변경
	@RequestMapping("/companyUpdateNick.me")
	public String companyUpdateNick(Member m, Model model, HttpSession session) {
		
		int result = memberService.updateNick(m);
		
		if(result>0) {
			// 닉네임 변경 성공
			Member loginUser = memberService.takeUserInfo(m);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "정보변경에 성공했습니다.");
			return "redirect:/companyMyPage.me";	
			
		}else {
		   // 닉네임 변경 실패
			model.addAttribute("errorMsg","닉네임 변경 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 개인 주소 변경
	@RequestMapping("/updateAddress.me")
	public String updateAddress(Member m, Model model, HttpSession session) {
		
		int result = memberService.updateAddress(m);
		
		if(result>0) {
			// 주소 변경 성공
			Member loginUser = memberService.takeUserInfo(m);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "정보변경에 성공했습니다.");
			return "redirect:/personalMyPage.me";	
			
		}else {
		   // 주소 변경 실패
			model.addAttribute("errorMsg","주소 변경 실패");
			return "common/errorPage";
		}
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/findId.me")
	public String findId(String memNick, String phone) {
		
		Member m = new Member();
		m.setMemNick(memNick);
		m.setPhone(phone);
		
		
		
		Member findUser = null;
		findUser = memberService.findId(m);
		
		if(findUser != null) {
			return findUser.getMemId();
		}else {
			return "N";
		}
		
	}


	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping("/findPwd.me")
	public String findPwd(String memId, String phone) {
		
		Member m = new Member();
		m.setMemId(memId);
		m.setPhone(phone);
		
		Member findUser = null;
		findUser = memberService.findPwd(m);
		
		if(findUser != null) {
			
			// 메시지 세팅
			SimpleMailMessage message = new SimpleMailMessage();
			
			message.setSubject("안녕하세요. BIGFISH입니다.");
			message.setText("고객님의 비밀번호는 "+findUser.getMemPwd()+"입니다.");
			
			// 보낼 곳 세팅
			String [] to = {findUser.getMemId()};
			message.setTo(to);
			
			// 발송
			sender.send(message);

			
			
			return "Y";
		}else {
			return "N";
		}
		
	}
	
	
	
	
	
	

}


