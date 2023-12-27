package com.kh.bigFish.fish.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fish.model.dao.FishDao;
import com.kh.bigFish.fish.model.vo.Fish;


@Service
public class FishServiceImpl implements FishService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FishDao fishDao;
	
	@Override
	public int selectFreshListCount() {
		return fishDao.selectFreshListCount(sqlSession);
	}

	@Override
	public ArrayList<Fish> selectFreshList(PageInfo pi) {
		return fishDao.selectFreshList(sqlSession, pi);
	}
	
	@Override
	public int selectSeaListCount() {
		return fishDao.selectSeaListCount(sqlSession);
	}

	@Override
	public ArrayList<Fish> selectSeaList(PageInfo pi) {
		return fishDao.selectSeaList(sqlSession, pi);
	}

	@Override
	public int insertFishInfo(Fish f) {
		return fishDao.insertFishInfo(sqlSession, f);
	}

	@Override
	public int increaseCount(int fishNo) {
		return fishDao.increaseCount(sqlSession, fishNo);
	}

	@Override
	public Fish selectFish(int fishNo) {
		return fishDao.selectFish(sqlSession, fishNo);
	}

	@Override
	public int updateFish(Fish f) {
		return fishDao.updateFish(sqlSession, f);
	}

	@Override
	public int deleteFish(int fishNo) {
		return fishDao.deleteFish(sqlSession, fishNo);
	}

	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return fishDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Fish> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return fishDao.selectSearchList(sqlSession, map, pi);
	}

}
