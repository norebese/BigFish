package com.kh.bigFish.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	
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
	@RequestMapping(value="/memberRservationDetail")
	public String memberRservationDetail() {
		
		return "member/memberReservationDetail";
	}
}
