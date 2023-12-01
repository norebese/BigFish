package com.kh.bigFish.store.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.store.model.dao.StoreDao;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int checkBusinessNo(String businessNo) {
		return storeDao.checkBusinessNo(sqlSession, businessNo);
	}
	
}
