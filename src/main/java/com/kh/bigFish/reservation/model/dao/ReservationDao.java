package com.kh.bigFish.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {

	public int insertReservation(SqlSessionTemplate sqlSession, Reservation R) {
		
		return sqlSession.insert("reservationMapper.insertReservation", R);
	}

	public int jungbokCheck(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.selectOne("reservationMapper.jungbokCheck", r);
	}

}
