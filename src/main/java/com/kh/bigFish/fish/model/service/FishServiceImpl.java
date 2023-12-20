package com.kh.bigFish.fish.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.attachment.model.vo.Attachment;
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
	public int selectListCount() {
		return fishDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Fish> selectList(PageInfo pi) {
		return fishDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertFishInfo(Fish f) {
		return fishDao.insertFishInfo(sqlSession, f);
	}
}
