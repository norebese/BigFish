package com.kh.bigFish.reservation.model.service;

import java.time.LocalDateTime;

import org.apache.ibatis.annotations.Param;

import com.kh.bigFish.reservation.model.vo.Reservation;

public interface ReservationService {

	int insertReservation(Reservation R);
	
	int jungbokCheck(Reservation R);
	
}
