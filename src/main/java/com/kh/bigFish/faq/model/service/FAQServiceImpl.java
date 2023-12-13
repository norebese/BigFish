package com.kh.bigFish.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.faq.model.dao.FAQDao;
import com.kh.bigFish.faq.model.vo.FAQ;

@Service
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FAQDao faqDao;
	
	@Override
	public int faqInsert(FAQ f) {
		return faqDao.faqInsert(sqlSession, f);
	}

	@Override
	public ArrayList<FAQ> selectList(PageInfo pi) {
		return faqDao.selectList(sqlSession, pi);
	}

	@Override
	public int selectListCount() {
		return faqDao.selectListCount(sqlSession);
	}

	@Override
	public FAQ selectFaq(int faqNo) {
		return faqDao.selectFaq(sqlSession, faqNo);
	}
	
	@Override
	public int updateFaq(FAQ f) {
		return faqDao.updateFaq(sqlSession, f);
	}

	@Override
	public int faqDelete(int faqNo) {
		return faqDao.faqDelete(sqlSession, faqNo);
	}


}
