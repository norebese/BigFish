package com.kh.bigFish.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.vo.Ticket;

@Repository
public class ReservationDao {

	public int insertReservation(SqlSessionTemplate sqlSession, Reservation R) {
		
		return sqlSession.insert("reservationMapper.insertReservation", R);
	}
	
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList", memNo, rowBounds);
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
	
	public ArrayList<Reservation> getMyStoreReservationList(SqlSessionTemplate sqlSession, Reservation r){
		return (ArrayList)sqlSession.selectList("reservationMapper.getMyStoreReservationList",r);
	}
	
	public int okReservation(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.update("reservationMapper.okReservation", revNo);
	}
	
	public int cancelReservation(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.update("reservationMapper.cancelReservation",revNo);
	}
	
	public ArrayList<Reservation> getRevStoreForChat(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("reservationMapper.getRevStoreForChat", memNo);
	}

	public int countReservationList(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("reservationMapper.countReservationList", memNo);
	}

}
