package com.kh.bigFish.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.store.model.dao.StoreDao;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

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
	
	@Override
	public int checkBusinessNo(String businessNo) {
		return storeDao.checkBusinessNo(sqlSession, businessNo);
	}

	@Override
	public int insertStore(Store s) {
		return storeDao.insertStore(sqlSession, s);
	}

	@Override
	public int insertTicket(Ticket t) {
		return storeDao.insertTicket(sqlSession, t);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return storeDao.insertAttachment(sqlSession, a);
	}
	
}

