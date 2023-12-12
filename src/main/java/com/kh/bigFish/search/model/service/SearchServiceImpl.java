package com.kh.bigFish.search.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.search.model.dao.SearchDao;
import com.kh.bigFish.study.model.vo.Study;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired SearchDao searchDao; 
	
	@Override
	public ArrayList<Study> selectSearchList(String keyword) {
		return searchDao.selectSearchList(sqlSession, keyword);
	}

}
