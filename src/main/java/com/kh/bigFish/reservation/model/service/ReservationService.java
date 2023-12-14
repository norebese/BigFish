package com.kh.bigFish.reservation.model.service;

import java.time.LocalDateTime;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.vo.Ticket;

public interface ReservationService {
	
	// 예약 삽입
	int insertReservation(Reservation R);
	
	// 예약 목록 불러오기(멤버기준)
	ArrayList<Reservation> selectReservationList(int memNo);
	
	// 중복체크
	int jungbokCheck(Reservation R);
	
	//예약 확정단계 선택된 이용권 정보 불러오기
	Ticket selectedTicket(int ticketNo);

	// 특정 예약 정보 가져오기
	Reservation getReservationService(int revNo);
	
}
