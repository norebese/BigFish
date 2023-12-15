package com.kh.bigFish.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.vo.Ticket;

@Repository
public class ReservationDao {

	public int insertReservation(SqlSessionTemplate sqlSession, Reservation R) {
		
		return sqlSession.insert("reservationMapper.insertReservation", R);
	}
	
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList", memNo);
	}

	public int jungbokCheck(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.selectOne("reservationMapper.jungbokCheck", r);
	}
	
	public Reservation getReservationService(SqlSessionTemplate sqlSession,int revNo) {
		return sqlSession.selectOne("reservationMapper.getReservationService", revNo);
	}

	public Ticket selectedTicket(SqlSessionTemplate sqlSession, int ticketNo) {
		return sqlSession.selectOne("storeMapper.selectedTicket", ticketNo);
	}

}
