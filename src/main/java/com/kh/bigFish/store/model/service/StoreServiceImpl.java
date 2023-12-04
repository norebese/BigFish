package com.kh.bigFish.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.store.model.dao.StoreDao;
import com.kh.bigFish.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Store> ajaxStoreList(Store s) {
		return storeDao.ajaxStoreList(sqlSession, s);
	}

	@Override
	public Store resDetailPage(int num) {
		return storeDao.resDetailPage(sqlSession, num);
	}
	
	
		
}
