package com.kh.bigFish.reservation.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reservation.model.service.ReservationService;
import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.vo.Store;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="/seaReservation")
	public String seaReservation() {
		
		return "reservation/seaReservation";
	}
	@RequestMapping(value="/insertReservationOne")
	public String insertReservationOne() {
		
		return "reservation/insertReservationOne";
	}
	@RequestMapping(value="/insertReservationTwo")
	public String insertReservationTwo() {
		
		return "reservation/insertReservationTwo";
	}
	@RequestMapping(value="/fishReservation")
	public String fishReservation() {
		
		return "reservation/fishReservation";
	}
	@RequestMapping(value="reservationDetail")
	public String reservationDetail() {
		
		return "reservation/reservationDetail";
	}
	

//	@RequestMapping("loadTickets")
//	@ResponseBody
//	public ArrayList<Ticket> loadTickets(){
//		
//		
//		
//		return Ticket;
//	}
	
	@RequestMapping("insertReservation")
	public void insertReservation(Reservation R , Member M, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Member Mem = (Member) session.getAttribute("loginUser");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		String endTime = request.getParameter("endTime");
		int numPeople = Integer.parseInt(request.getParameter("numPeople"));

		String dateTimeString = String.format("%s-%s-%s %s", year, month, day, time);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime localDateTime = LocalDateTime.parse(dateTimeString, formatter);
		String formattedDateTime = localDateTime.format(formatter);
		
		String dateTimeStringE = String.format("%s-%s-%s %s", year, month, day, endTime);
		DateTimeFormatter formatterE = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime localDateTimeE = LocalDateTime.parse(dateTimeStringE, formatterE);
		String formattedDateTimeE = localDateTimeE.format(formatterE);
        
		R.setRmemNo(Mem.getMemNo());
		R.setRevStart(formattedDateTime);
		R.setRevEnd(formattedDateTimeE);
		R.setRevPeople(numPeople);
        
		session.setAttribute("M", Mem);
        session.setAttribute("R", R);
	}
	
	@RequestMapping("confirmReservation")
	public String confirmReservation(Reservation R, HttpServletRequest request, HttpSession session) {
		Reservation Rev = (Reservation) session.getAttribute("R");
		Store st = (Store) session.getAttribute("st");
		String name = request.getParameter("revName");
		int phone = Integer.parseInt(request.getParameter("revPhone"));
		String requestment = request.getParameter("revRequest");
		
		Rev.setRstoreNo(st.getStoreNo());
		Rev.setRevName(name);
		Rev.setRevPhone(phone);
		Rev.setRevRequest(requestment);
		
		System.out.println(Rev);
		int result = reservationService.insertReservation(Rev);
		
		session.setAttribute("alertMsg", "에약 완료");
		return "redirect:reservationDetail";
	}
	
	
	
	
	
	
}
