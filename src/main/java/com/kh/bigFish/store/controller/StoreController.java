package com.kh.bigFish.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reply.model.service.ReplyService;
import com.kh.bigFish.reply.model.vo.Reply;
import com.kh.bigFish.reservation.model.service.ReservationService;
import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.service.StoreService;
import com.kh.bigFish.store.model.vo.Slike;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

@Controller
public class StoreController {
	public static final String SERVICE_KEY = "O%2BHuQXOnHrSKrJPhQjimjUX71FMDrrL%2FDw0vWU1V4gDVesEDjPb54npPCusEwxpNd4qv6NYjAIBQO7dEWv0VsA%3D%3D";

	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/storeEnrollForm.sto")
	public String storeEnrollForm() {
		return "store/storeEnrollForm";
		
	}
	
	@RequestMapping(value="/storeUpdateForm.sto")
	public String storeUpdateForm(Store s, Model model) {
		
		Store storeInfo = storeService.getStoreInfo(s.getStoreNo());
		ArrayList<Ticket> ticketArr = storeService.getAllTicketInfo(s.getStoreNo());
		ArrayList<Attachment> attArr = storeService.getStoreAtt(s.getStoreNo());
		
		// 주중 영업 시간 가공
		String weekdayStart = storeInfo.getStoreWeekday().substring(0, 5);
		String weekdayEnd = storeInfo.getStoreWeekday().substring(8);
		// 주말 영업 시간 가공
		String weekendStart = storeInfo.getStoreWeekend().substring(0, 5);
		String weekendEnd = storeInfo.getStoreWeekend().substring(8);

		String fishKindArr = storeInfo.getStoreFishKind();
		
		
	
		
		
		model.addAttribute("storeInfo", storeInfo);
		model.addAttribute("weekdayStart",weekdayStart);
		model.addAttribute("weekdayEnd",weekdayEnd);
		model.addAttribute("weekendStart",weekendStart);
		model.addAttribute("weekendEnd",weekendEnd);
		model.addAttribute("fishKindArr", fishKindArr);
		model.addAttribute("ticketArr", new Gson().toJson(ticketArr));
		model.addAttribute("attArr", new Gson().toJson(attArr));
		
		return "store/storeUpdateForm";
	}
	
	@RequestMapping("storeUpdate")
	public String storeUpdate(HttpSession session, Store s,String[] StoreFishKindArray,
								String[] ticketNameArray, int[] ticketPriceArray, int[] ticketTimeArray, 
								String[] storeWeekdayArray, String[] storeWeekendArray, Model model,
								MultipartFile[] upfile) {
		
		
		
		
		System.out.println(s);


		
		ArrayList<Attachment> attArray = storeService.getStoreAttForUpdate(s.getStoreNo());
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
		
		
		
		
	
		if(!upfile[0].getOriginalFilename().equals("") ||
			!upfile[1].getOriginalFilename().equals("")||
			!upfile[2].getOriginalFilename().equals("")||
			!upfile[3].getOriginalFilename().equals("")||
			!upfile[4].getOriginalFilename().equals("")||
			!upfile[5].getOriginalFilename().equals("")||
			!upfile[6].getOriginalFilename().equals("")) {
			
				int i = 0;
				for(MultipartFile fi : upfile) {
					String changeName = saveFile(fi, session,"/resources/uploadFiles/");
					
					
//					Attachment att = new Attachment();
//					att.setOriginName(fi.getOriginalFilename());
//					att.setChangeName(changeName);
//					att.setFileLevel(2);
//					att.setFilePath(session.getServletContext().getRealPath("/resources/uploadFiles/"));
					
					attArray.get(i).setOriginName(fi.getOriginalFilename());
					attArray.get(i).setChangeName(changeName);
					attArray.get(i).setFileLevel(2);
					
					i++;
				}
			
			
		}
		
		attArray.get(0).setFileLevel(1);
		System.out.println(attArray);
		
		int storeResult = storeService.updateStore(s);
		
		if(storeResult>0) {
			
			for(Attachment a : attArray) {
				storeService.updateAtt(a);
			}
			
			session.setAttribute("alertMsg", "사업장 수정에 성공했습니다.");
			return "redirect:/companyMyPage.me";
		} else {
			
			
			
			model.addAttribute("errorMsg","사업장 수정 실패");
			return "common/errorPage";
		}
		
		
		
	}
	
	@RequestMapping("storeEnroll")
	public String storeEnroll(Store s, String[] StoreFishKindArray,
								String[] ticketNameArray, int[] ticketPriceArray, int[] ticketTimeArray, 
								String[] storeWeekdayArray, String[] storeWeekendArray,
								HttpSession session, MultipartFile[] upfile, Model model) {
		
		ArrayList<Attachment> attArray = new ArrayList<Attachment>();
		ArrayList<Ticket> ticArray = new ArrayList<Ticket>();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		s.setRmemNo(loginUser.getMemNo());
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
			att.setFileLevel(2);
			att.setFilePath(session.getServletContext().getRealPath("/resources/uploadFiles/"));
			
			attArray.add(att);
		}
		
		attArray.get(0).setFileLevel(1);
		
		int storeResult = storeService.storeEnroll(s);
		
		if(storeResult>0) {
			
			// Ticket 삽입
			for(Ticket t : ticArray) {
				storeService.insertTicket(t);
			}
			
			// Attachment 삽입
			for(Attachment a : attArray) {
				storeService.insertAttachment(a);
			}
			
			session.setAttribute("alertMsg", "사업장 등록에 성공했습니다.");
			return "redirect:/companyMyPage.me";
			
		}else {
		   // 매장 추가 실패
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
	
	// 사업자 번호 중복체크
	@ResponseBody
	@RequestMapping(value="/checkSameNo")
	public String checkBusinessNo(String businessNo) {
		
		int result = storeService.checkBusinessNo(businessNo);
		
		if(result>0) {
			// 해당 사업자번호 사용 불가 (같은 닉네임 있음)
			return "N";
		}else {
			// 해당 사업자번호 사용 가능 (같은 닉네임 없음)
			return "Y";
		}
		
	}
	
	@RequestMapping(value="/fishReservation")
	public String fishReservation(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int storeCount = storeService.storeCount();
		
		PageInfo pi = Pagenation.getPageInfo(storeCount, currentPage, 10, 6);
		
		ArrayList<Store> storeList = storeService.storeList(pi);
		for (Store store : storeList) {
			if(store.getThumbnailImg() == null) {
				store.setThumbnailImg("no Img.png");
			}
		}
		
		model.addAttribute("storeList", storeList);
		model.addAttribute("pi", pi);
		
		return "reservation/fishReservation";
	}
	
	@ResponseBody
	@RequestMapping(value="fishReservationAddPage", produces="application/json; charset=UTF-8")
	public Map<String, Object> fishReservationAddPage(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		int Page =Integer.parseInt(request.getParameter("cpage"));
		int storeCount = storeService.storeCount();
		
		PageInfo pi = Pagenation.getPageInfo(storeCount, Page, 10, 6);
		
		ArrayList<Store> storeList = storeService.storeList(pi);
		for (Store store : storeList) {
			if(store.getThumbnailImg() == null) {
				store.setThumbnailImg("no Img.png");
			}
		}
		result.put("list", storeList);
	    result.put("storeCount", storeCount);
	    result.put("pi", pi);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxStoreList", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxStoreList(Store S ,HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		String Region = request.getParameter("selectedRegion");
		String City = request.getParameter("selectedCity");
		int Page =Integer.parseInt(request.getParameter("dpage"));
		
		S.setLocationBig(Region);
		S.setLocationSmall(City);
		
		int storeCount = storeService.filteredStoreCount(S);
		
		PageInfo piA = Pagenation.getPageInfo(storeCount, Page, 10, 6);
		
		ArrayList<Store> list = storeService.ajaxStoreList(S, piA);
		for (Store store : list) {
			if(store.getThumbnailImg() == null) {
				store.setThumbnailImg("no Img.png");
			}
		}
		session.setAttribute("piA", piA);
		
		result.put("list", list);
	    result.put("storeCount", storeCount);
	    result.put("piA", piA);
		
		return result;
	}
	
	@RequestMapping("resDetailPage")
	public String resDetailPage(HttpServletRequest request, HttpSession session) {
		Member Mem = (Member) session.getAttribute("loginUser");
		int storeNum = Integer.parseInt(request.getParameter("storeNumber"));
		Store st = storeService.resDetailPage(storeNum);
		Slike checkLikeTable = new Slike();
		
		if(Mem != null) {
			int memNo = Mem.getMemNo();
			
			checkLikeTable = storeService.checkLikeTable(memNo, storeNum);
			
			if(checkLikeTable==null) {
				int createLikeTable = storeService.createLikeTable(memNo, storeNum);
			}
		}
		List<String> fishKinds = Arrays.asList(st.getStoreFishKind().split("/"));
		Map<String, String> fishImageMap = new HashMap<>();
	    for (String fishKind : fishKinds) {
	        String imageName = storeService.showFishImg(fishKind);
	        if(imageName == null) {
	        	imageName = "/bigFish/resources/images/fish ex.png";
	        }
	        fishImageMap.put(fishKind, imageName);
	    }
		
		Reply R = new Reply();
		R.setRstoreNo(storeNum);
		int storeReplyCount = replyService.storeReplyCount(R);
		PageInfo pi = Pagenation.getPageInfo(storeReplyCount, 1, 5, 5);
		
		ArrayList<Reply> replyList = replyService.storeReplyList(pi, storeNum);
		
		ArrayList<Attachment> storePhoto = storeService.storePhoto(storeNum);
		
		session.setAttribute("st", st);
		session.setAttribute("Slike", checkLikeTable);
		session.setAttribute("fishImageMap", fishImageMap);
		session.setAttribute("replyList", replyList);
		session.setAttribute("replyCount", storeReplyCount);
		session.setAttribute("replyPi", pi);
		session.setAttribute("storePhoto", storePhoto);
		return "reservation/reservationDetail";
	}
	
	@RequestMapping("ajaxUpdateLike")
	public void ajaxUpdateLike(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		Slike sk = new Slike();
		Store s = (Store) session.getAttribute("st");
		Member Mem = (Member) session.getAttribute("loginUser");
		int storeNum = s.getStoreNo();
		
		sk.setRmemNo(Mem.getMemNo());
		sk.setRstoreNo(storeNum);
		
		Slike likeResult = storeService.likeResult(sk);
		String result = null;
		System.out.println("likeResult :"+likeResult);
		
		if(likeResult.getStoreGoodStatus().equals("N")) {
			result = "Y";
		}else {
			result = "N";
		}
		
		int storeUpdateLike = storeService.storeUpdateLike(sk, result);
		
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="loadTickets", produces="application/json; charset=UTF-8")
	public ArrayList<Ticket> loadTickets(Reservation R, Ticket t, HttpServletRequest request, HttpSession session){
		Store s = (Store) session.getAttribute("st");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		int pAmount = s.getMaxMember();
		
		String dateTimeString = String.format("%s-%s-%s %s", year, month, day, time);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime localDateTime = LocalDateTime.parse(dateTimeString, formatter);
		String startTime = localDateTime.format(formatter);
		
		//이용권 정보 받아오기
		t.setRstoreNo(s.getStoreNo());
		ArrayList<Ticket> TicketTime = storeService.TicketTime(t);
		
		for (Ticket ticket : TicketTime) {
			int timeE = ticket.getTicketTime();
			
			DateTimeFormatter formatterE = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			LocalDateTime existingDateTime = LocalDateTime.parse(startTime, formatterE);
			LocalDateTime updatedDateTime = existingDateTime.plusHours(timeE);
			String endTime = updatedDateTime.format(formatter);
			
			R.setRstoreNo(s.getStoreNo());
			R.setRevStart(startTime);
			R.setRevEnd(endTime);
			int jungbok = reservationService.jungbokCheck(R);
			
		    ticket.setAmount(pAmount - jungbok);
		}
		
		return TicketTime;
	}
	
	@RequestMapping(value="/seaReservation")
	public String seaReservation(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int seaStoreCount = storeService.seaStoreCount();
		
		PageInfo pi = Pagenation.getPageInfo(seaStoreCount, currentPage, 10, 6);
		
		ArrayList<Store> seaStoreList = storeService.seaStoreList(pi);
		for (Store store : seaStoreList) {
			if(store.getThumbnailImg() == null) {
				store.setThumbnailImg("no Img.png");
			}
		}

		model.addAttribute("seaStoreList", seaStoreList);
		model.addAttribute("pi", pi);

		return "reservation/seaReservation";
	}
	
	@ResponseBody
	@RequestMapping(value="seaReservationAddPage", produces="application/json; charset=UTF-8")
	public Map<String, Object> seaReservationAddPage(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		int currentPage =Integer.parseInt(request.getParameter("cpage"));
		int seaStoreCount = storeService.seaStoreCount();
		
		PageInfo pi = Pagenation.getPageInfo(seaStoreCount, currentPage, 10, 6);
		
		ArrayList<Store> seaStoreList = storeService.seaStoreList(pi);
		for (Store store : seaStoreList) {
			if(store.getThumbnailImg() == null) {
				store.setThumbnailImg("no Img.png");
			}
		}
		
		result.put("seaStoreList", seaStoreList);
	    result.put("pi", pi);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxSeaAreaFilter", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxSeaAreaFilter(HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		String City1 = request.getParameter("param1");
		String City2 = request.getParameter("param2");
		String City3 = request.getParameter("param3");
		String City4 = request.getParameter("param4");
		String City5 = request.getParameter("param5");
		String City6 = request.getParameter("param6");
		
		int ajaxSeaStoreCount = storeService.ajaxSeaStoreCount(City1, City2, City3, City4, City5, City6);
		
		PageInfo piS = Pagenation.getPageInfo(ajaxSeaStoreCount, 1, 10, 6);
		
		ArrayList<Store> list = storeService.ajaxSeaStoreList(piS, City1, City2, City3, City4, City5, City6);
		for (Store store : list) {
			if(store.getThumbnailImg() == null) {
				store.setThumbnailImg("no Img.png");
			}
		}
		
		ArrayList<String> cityNames = new ArrayList<String>();
		cityNames.add(City1);
		cityNames.add(City2);
		cityNames.add(City3);
		cityNames.add(City4);
		cityNames.add(City5);
		cityNames.add(City6);
		
		result.put("list", list);
	    result.put("piS", piS);
	    result.put("cityNames", cityNames);
	    
	    //선택된 가게들 어종 정보 가져오기
	    List<String> FKind = storeService.fishKindList(City1, City2, City3, City4, City5, City6);
	    Map<String, Integer> wordCountMap = new HashMap<>();
	    
	    for (String fishKind : FKind) {
            String[] words = fishKind.split("/");
            for (String word : words) {
                wordCountMap.put(word, wordCountMap.getOrDefault(word, 0) + 1);
            }
        }
	    //어종 중복 많은 순서로 정렬
	    List<Map.Entry<String, Integer>> sortedEntries = new ArrayList<>(wordCountMap.entrySet());
        sortedEntries.sort(Map.Entry.<String, Integer>comparingByValue().reversed());
        
        result.put("fishKindList", sortedEntries);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxSeaAreaMore", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxSeaAreaMore(HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		String City1 = request.getParameter("param1");
		String City2 = request.getParameter("param2");
		String City3 = request.getParameter("param3");
		String City4 = request.getParameter("param4");
		String City5 = request.getParameter("param5");
		String City6 = request.getParameter("param6");
		int sPage = Integer.parseInt(request.getParameter("sPage"));
		
		int ajaxSeaStoreCount = storeService.ajaxSeaStoreCount(City1, City2, City3, City4, City5, City6);
		
		PageInfo piS = Pagenation.getPageInfo(ajaxSeaStoreCount, sPage, 10, 6);
		
		ArrayList<Store> list = storeService.ajaxSeaAreaMore(piS, City1, City2, City3, City4, City5, City6);
		for (Store store : list) {
			if(store.getThumbnailImg() == null) {
				store.setThumbnailImg("no Img.png");
			}
		}
		
		result.put("list", list);
	    result.put("piS", piS);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxStoreKindFilter", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxStoreKindFilter(HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		String City1 = request.getParameter("param1");
		String City2 = request.getParameter("param2");
		String City3 = request.getParameter("param3");
		String City4 = request.getParameter("param4");
		String City5 = request.getParameter("param5");
		String City6 = request.getParameter("param6");
		int sfPage = Integer.parseInt(request.getParameter("sfPage"));
		int filterNum = Integer.parseInt(request.getParameter("selectedOption"));
		
		int ajaxSeaStoreCountF = storeService.ajaxSeaStoreCountF(City1, City2, City3, City4, City5, City6, filterNum);
		
		PageInfo piS = Pagenation.getPageInfo(ajaxSeaStoreCountF, sfPage, 10, 6);
		
		ArrayList<Store> list = storeService.ajaxStoreKindFilter(piS, City1, City2, City3, City4, City5, City6, filterNum);
		for (Store store : list) {
			if(store.getThumbnailImg() == null) {
				store.setThumbnailImg("no Img.png");
			}
		}
		result.put("list", list);
		result.put("count", ajaxSeaStoreCountF);
	    result.put("piS", piS);
		
	    return result;
	}
	
	@ResponseBody
	@RequestMapping(value="getStoreForChat", produces="application/json; charset=UTF-8")
	public String getStoreForChat(String storeNo){
		System.out.println(storeNo);
		
		Store s = storeService.getStoreForChat(storeNo);
		
		return new Gson().toJson(s);
	}
	

	@ResponseBody
	@RequestMapping("updateStoreStatus")
	public String updateStoreStatus(String storeNo, String storeStatus) {
		
		System.out.println(storeNo);
		System.out.println(storeStatus);
		
		Store s = new Store();
		s.setStoreNo(Integer.parseInt(storeNo));
		
		if(storeStatus.equals("open")) {
			s.setStoreStatus("stopOpen");
		}else {
			s.setStoreStatus("open");
		}
		
		int updateResult = storeService.updateStoreStatus(s);
		
		return updateResult+"";
	}
	
	
	@ResponseBody
	@RequestMapping("checkBusinessNoForDelete")
	public String checkBusinessNoForDelete(String businessNo) {
		
		int result = storeService.checkBusinessNoForDelete(businessNo);
		
		if(result>0) {
			return "Y";
		}else {
			return "N";
		}
		
		
	}
	
	@RequestMapping("businessDelete")
	public String businessDelete(String businessNo) {
		
		int result = storeService.businessDelete(businessNo);
		
		
		return "redirect:/companyMyPage.me";
	}

		

	@RequestMapping(value="/storeRegisterPage")
	public String storeRegisterPage(HttpSession session) {
		Member Mem = (Member) session.getAttribute("loginUser");
		int MemNo = Mem.getMemNo();
		
		ArrayList<Store> list = storeService.myStoreList(MemNo);
				
		session.setAttribute("myStoreList", list);
		
		return "store/storeRegisterPage";
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxUpdateDetailInfo" )
	public Map<String, Object> ajaxUpdateDetailInfo(HttpServletRequest request){
		Map<String, Object> result = new HashMap<>();
		int storeNum = Integer.parseInt(request.getParameter("storeNum"));
		String info = request.getParameter("infoVal");
		
		int updateDetailInfo = storeService.updateDetailInfo(storeNum, info);
		String detailInfo = storeService.detailInfo(storeNum);
		
		result.put("info", updateDetailInfo);
		result.put("detail", detailInfo);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="seaWeather", produces = "application/json; charset=UTF-8")
	public String seaWeather(String location) throws IOException, ParseException {
		String url = "http://apis.data.go.kr/1360000/VilageFcstMsgService/getSeaFcst";
		url += "?serviceKey="+ SERVICE_KEY;
		url += ("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		url +=("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	    url +=("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
	    url +=("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode(location, "UTF-8")); /*12A20100 (서해중부앞바다), 12B20100(남해동부앞바다) 등... 별첨 엑셀자료 참조(‘해상’ 구분 값 참고)*/

		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(responseText);
		JSONObject response = (JSONObject)jsonObject.get("response");
		JSONObject body = (JSONObject)response.get("body");
		JSONObject items = (JSONObject)body.get("items");
		JSONArray item = (JSONArray)items.get("item");
		//JSONObject data = null;
		
		return new Gson().toJson(item);
	}

	@ResponseBody
	@RequestMapping(value="showFish")
	public Map<String, Object> showFish(HttpServletRequest request){
		Map<String, Object> result = new HashMap<>();
		String fish = request.getParameter("fish");
		
		String img = storeService.showFishImg(fish);
		String fishNo = storeService.getFishNo(fish);
		
		if(img != null) {
			result.put("img", img);
			result.put("fishNo", fishNo);
		}else {
			img = "/bigFish/resources/images/fish ex.png";
			result.put("img", img);
			result.put("fishNo", null);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="showRecentStore")
	public ArrayList<Store> showRecentStore(HttpServletRequest request){

		ArrayList<Store> storeList = new ArrayList<>();
		
		for (int i = 1; i <= 5; i++) {
	        int storeNumber = Integer.parseInt(request.getParameter("store" + i));
	        if(storeNumber != 0) {
	        	Store list = storeService.showRecentStore(storeNumber);
	    		if(list.getThumbnailImg() == null) {
	    			list.setThumbnailImg("no Img.png");
	    		}
	        	storeList.add(list);
	        }
	    }
		return storeList;
	}
}

