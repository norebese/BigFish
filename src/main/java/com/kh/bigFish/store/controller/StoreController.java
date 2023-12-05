package com.kh.bigFish.store.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bigFish.store.model.service.StoreService;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
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
	
	@ResponseBody
	@RequestMapping(value="ajaxStoreList", produces="application/json; charset=UTF-8")
	public ArrayList<Store> ajaxStoreList(Store S ,HttpServletRequest request) {
		String Region = request.getParameter("selectedRegion");
		String City = request.getParameter("selectedCity");
		
		S.setLocationBig(Region);
		S.setLocationSmall(City);
		
		ArrayList<Store> list = storeService.ajaxStoreList(S);
		
		return list;
	}
	
	@RequestMapping("resDetailPage")
	public String resDetailPage(HttpServletRequest request, HttpSession session) {
		int storeNum = Integer.parseInt(request.getParameter("storeNumber"));
		
		Store st = storeService.resDetailPage(storeNum);
		
		List<String> fishKinds = Arrays.asList(st.getStoreFishKind().split("/"));
		
		session.setAttribute("st", st);
		session.setAttribute("fishKinds", fishKinds);
		
		return "reservation/reservationDetail";
	}
	
//	@RequestMapping("loadTickets")
//	public ArrayList<Ticket> loadTickets(HttpServletRequest request){
//		String year = request.getParameter("year");
//		String month = request.getParameter("month");
//		String day = request.getParameter("day");
//		String time = request.getParameter("time");
//		
//		String dateTimeString = String.format("%s-%s-%s %s", year, month, day, time);
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		LocalDateTime localDateTime = LocalDateTime.parse(dateTimeString, formatter);
//		String startTime = localDateTime.format(formatter);
//		
//		//이용권 시간 받아오기
//		ArrayList<Ticket> TicketTime = storeService.TicketTime();
//		
//		//받은 티켓 정보에서 이용시간ticketTime을 받아서(ex3시간) 파라미터에서 받은 시작 시간과 티켓이용시간을 더한 끝시간을 구해서 reservation table에서의 중복된 시간을 구한다. 
//		//반복문을 여기에 적용시켜 각 객체의 ticketTime을 
//		for(int i =0; i<= TicketList.size(); i++) {
//			시작시간 끝시간 받아서 reservationService 를 통해 시간이 겹치는 숫자를 받아온다/ 그 숫자를 해당 사업자 최대 인원수 의 값에서 빼준 최종 남은 숫자를 구한다.
//			그 숫자를 ArrayList<Ticket> TicketList에 반복문을 통해 하나하나 넣어준다.TicketList를 반복문 돌려서 하나하나 setAmount해준다.
//			
//			인원수의 경우 겹치는 카운트에 -1해서 더해주면 될듯
//			ArrayList<Ticket> TicketListPlus = storeService.loadTicketsPlus(TicketList.get(i).getTicketTime());
//		}
//		
//		
//		
//		
//		return TicketList;
//	}
	

}
