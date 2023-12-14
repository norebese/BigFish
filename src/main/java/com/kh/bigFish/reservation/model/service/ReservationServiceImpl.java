package com.kh.bigFish.reservation.model.service;

import java.time.LocalDateTime;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.reservation.model.dao.ReservationDao;
import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.vo.Ticket;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReservation(Reservation R) {
		
		return reservationDao.insertReservation(sqlSession, R);
	}

	@Override
	public ArrayList<Reservation> selectReservationList(int memNo) {
		return reservationDao.selectReservationList(sqlSession, memNo);
	}
	@Override
	public int jungbokCheck(Reservation R) {
		return reservationDao.jungbokCheck(sqlSession, R);
	}

	@Override
	public Ticket selectedTicket(int ticketNo) {
		return reservationDao.selectedTicket(sqlSession, ticketNo);
	}

	@Override
	public Reservation getReservationService(int revNo) {
		return reservationDao.getReservationService(sqlSession, revNo);
	}

}
