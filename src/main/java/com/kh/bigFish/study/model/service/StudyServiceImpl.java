package com.kh.bigFish.study.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.study.model.dao.StudyDao;
import com.kh.bigFish.study.model.vo.Study;

@Service
public class StudyServiceImpl implements StudyService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired StudyDao studyDao; 
	
	@Override
	public int selectListCount() {
		return studyDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Study> selectList(PageInfo pi) {
		return studyDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertStudy(Study s) {
		return studyDao.insertStudy(sqlSession, s);
	}

	@Override
	public int increaseCount(int studyNo) {
		return studyDao.increaseCount(sqlSession, studyNo);
	}

	@Override
	public Study selectStudy(int studyNo) {
		return studyDao.selectStudy(sqlSession, studyNo);
	}

	@Override
	public int deleteStudy(int studyNo) {
		return studyDao.deleteStudy(sqlSession, studyNo);
	}

	@Override
	public int updateStudy(Study s) {
		return studyDao.updateStudy(sqlSession, s);
	}

}
