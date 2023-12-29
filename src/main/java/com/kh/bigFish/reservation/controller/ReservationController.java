package com.kh.bigFish.reservation.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reservation.model.service.ReservationService;
import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="/insertReservationOne")
	public String insertReservationOne() {
		
		return "reservation/insertReservationOne";
	}
	@RequestMapping(value="/insertReservationTwo")
	public String insertReservationTwo() {
		
		return "reservation/insertReservationTwo";
	}
	
	@RequestMapping(value="reservationDetail")
	public String reservationDetail() {
		
		return "reservation/reservationDetail";
	}
	

	
	@RequestMapping("insertReservation")
	public void insertReservation(Reservation R , Member M, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Member Mem = (Member) session.getAttribute("loginUser");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		int ticketNo =Integer.parseInt(request.getParameter("ticketNo"));
		int ticketTime =Integer.parseInt(request.getParameter("ticketTime"));
		int numPeople = Integer.parseInt(request.getParameter("numPeople"));

		String dateTimeString = String.format("%s-%s-%s %s", year, month, day, time);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime localDateTime = LocalDateTime.parse(dateTimeString, formatter);
		String formattedDateTime = localDateTime.format(formatter);
		
		LocalDateTime updatedDateTime = localDateTime.plusHours(ticketTime);
		String formattedDateTimeE = updatedDateTime.format(formatter);
		
		R.setRticketNo(ticketNo);
		R.setRmemNo(Mem.getMemNo());
		R.setRevStart(formattedDateTime);
		R.setRevEnd(formattedDateTimeE);
		R.setRevPeople(numPeople);
		
		Ticket tk = reservationService.selectedTicket(ticketNo);
        
		session.setAttribute("tk", tk);
		session.setAttribute("M", Mem);
        session.setAttribute("R", R);
	}
	
	@RequestMapping("confirmReservation")
	public String confirmReservation(Reservation R, HttpServletRequest request, HttpSession session) {
		Reservation Rev = (Reservation) session.getAttribute("R");
		Store st = (Store) session.getAttribute("st");
		String name = request.getParameter("revName");
		String phone = request.getParameter("revPhone");
		String requestment = request.getParameter("revRequest");
		System.out.println(phone);
		
		Rev.setRstoreNo(st.getStoreNo());
		Rev.setRevName(name);
		Rev.setRevPhone(phone);
		Rev.setRevRequest(requestment);
		
		int result = reservationService.insertReservation(Rev);
		
		session.setAttribute("alertMsg", "예약 완료");
		return "redirect:reservationDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="getMyStoreReservationList", produces="application/text; charset=UTF-8")
	public String getMyStoreReservationList(String day, String month, String year, int storeNo) {

		String choiceDate = year.substring(2)+"/"+month+"/"+day;
		
		
		Reservation r = new Reservation();
		
		r.setRstoreNo(storeNo);
		r.setChoiceDate(choiceDate);
		
		ArrayList<Reservation> arrList = reservationService.getMyStoreReservationList(r);
		
		

		return new Gson().toJson(arrList);
	}
	
	@ResponseBody
	@RequestMapping("okReservation")
	public String okReservation(int revNo) {
		
		int result = reservationService.okReservation(revNo);
		
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping("cancelReservation")
	public String cancelReservation(int revNo) {
		
		int result = reservationService.cancelReservation(revNo);
		
		return result+"";
	}

}
