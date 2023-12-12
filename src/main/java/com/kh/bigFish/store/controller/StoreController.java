package com.kh.bigFish.store.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String storeUpdateForm() {
		return "store/storeUpdateForm";
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
		
		PageInfo pi = Pagenation.getPageInfo(storeCount, currentPage, 10, 5);
		
		ArrayList<Store> storeList = storeService.storeList(pi);
//		for (Store store : storeList) {
//			System.out.println(store);
//		}
		model.addAttribute("storeList", storeList);
		model.addAttribute("pi", pi);
		
		return "reservation/fishReservation";
	}
	
	@ResponseBody
	@RequestMapping(value="fishReservationAddPage", produces="application/json; charset=UTF-8")
	public ArrayList<Store> fishReservationAddPage(HttpServletRequest request) {
		
		int Page =Integer.parseInt(request.getParameter("cpage"));
		int storeCount = storeService.storeCount();
		
		PageInfo pi = Pagenation.getPageInfo(storeCount, Page, 10, 5);
		
		ArrayList<Store> storeList = storeService.storeList(pi);
		
		return storeList;
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
		
		PageInfo piA = Pagenation.getPageInfo(storeCount, Page, 10, 5);
		
		ArrayList<Store> list = storeService.ajaxStoreList(S, piA);
		
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
		
		Reply R = new Reply();
		R.setRstoreNo(storeNum);
		int storeReplyCount = replyService.storeReplyCount(R);
		PageInfo pi = Pagenation.getPageInfo(storeReplyCount, 1, 5, 5);
		
		ArrayList<Reply> replyList = replyService.storeReplyList(pi, storeNum);
		
		session.setAttribute("st", st);
		session.setAttribute("Slike", checkLikeTable);
		session.setAttribute("fishKinds", fishKinds);
		session.setAttribute("replyList", replyList);
		session.setAttribute("replyCount", storeReplyCount);
		session.setAttribute("replyPi", pi);
		
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
		System.out.println(sk);
		Slike likeResult = storeService.likeResult(sk);
		String result = null;
		System.out.println("likeResult :"+likeResult);
		
		if(likeResult.getStoreGoodStatus().equals("N")) {
			result = "Y";
		}else {
			result = "N";
		}
		System.out.println(result);
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
			System.out.println(R);
			int jungbok = reservationService.jungbokCheck(R);
			System.out.println("jungbok :"+jungbok);
			
		    ticket.setAmount(pAmount - jungbok);
		}
		
		return TicketTime;
	}
	
	@RequestMapping(value="/seaReservation")
	public String seaReservation(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int seaStoreCount = storeService.seaStoreCount();
		
		PageInfo pi = Pagenation.getPageInfo(seaStoreCount, currentPage, 10, 5);
		
		ArrayList<Store> seaStoreList = storeService.seaStoreList(pi);
//		for (Store store : seaStoreList) {
//			System.out.println(store);
//		}
		model.addAttribute("seaStoreList", seaStoreList);
		model.addAttribute("pi", pi);

		return "reservation/seaReservation";
	}
	
	@ResponseBody
	@RequestMapping(value="seaReservationAddPage", produces="application/json; charset=UTF-8")
	public ArrayList<Store> seaReservationAddPage(HttpServletRequest request) {
		
		int currentPage =Integer.parseInt(request.getParameter("cpage"));
		int seaStoreCount = storeService.seaStoreCount();
		
		PageInfo pi = Pagenation.getPageInfo(seaStoreCount, currentPage, 10, 5);
		
		ArrayList<Store> seaStoreList = storeService.seaStoreList(pi);
		
		return seaStoreList;
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
		
		PageInfo piS = Pagenation.getPageInfo(ajaxSeaStoreCount, 1, 10, 5);
		
		ArrayList<Store> list = storeService.ajaxSeaStoreList(piS, City1, City2, City3, City4, City5, City6);
		
		ArrayList<String> cityNames = new ArrayList<String>();
		cityNames.add(City1);
		cityNames.add(City2);
		cityNames.add(City3);
		cityNames.add(City4);
		cityNames.add(City5);
		cityNames.add(City6);
		
		result.put("list", list);
	    result.put("count", ajaxSeaStoreCount);
	    result.put("cityNames", cityNames);
		
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
		
		PageInfo piS = Pagenation.getPageInfo(ajaxSeaStoreCount, sPage, 10, 5);
		
		ArrayList<Store> list = storeService.ajaxSeaAreaMore(piS, City1, City2, City3, City4, City5, City6);
		
		result.put("list", list);
	    result.put("piS", piS);
		
		return result;
	}
	
	
	
	

}
