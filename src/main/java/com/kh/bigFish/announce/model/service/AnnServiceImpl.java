package com.kh.bigFish.announce.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.announce.model.dao.AnnDao;
import com.kh.bigFish.announce.model.vo.Announce;
import com.kh.bigFish.common.model.vo.PageInfo;

@Service
public class AnnServiceImpl implements AnnService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AnnDao annDao;
	@Override
	public int selectListCount() {
		return annDao.selectListCount(sqlSession);
	}
	@Override
	public ArrayList<Announce> selectList(PageInfo pi) {
		return annDao.selectList(sqlSession, pi);
	}
	@Override
	public int InsertAnn(Announce a) {
		return annDao.InsertAnn(sqlSession, a);
	}
	@Override
	public int increaseCount(int annCount) {
		return  annDao.increaseCount(sqlSession, annCount);
	}
	@Override
	public Announce selectAnnounce(int annNo) {
		return annDao.selectAnnounce(sqlSession, annNo);
	}
	@Override
	public int updateAnnounce(Announce a) {
		return annDao.updateAnnounce(sqlSession, a);
	}
	@Override
	public int deleteAnn(int annNo) {
		return annDao.deleteAnn(sqlSession, annNo);
	}
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return annDao.selectSearchListCount(sqlSession, map);
	}
	@Override
	public ArrayList<Announce> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return annDao.selectSearchList(sqlSession, map, pi);
	}
}
