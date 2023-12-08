package com.kh.bigFish.study.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.reply.model.vo.Reply;
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
//		System.out.println(s);
		return studyDao.updateStudy(sqlSession, s);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int sno) {
		return studyDao.selectReplyList(sqlSession, sno);
	}

	@Override
	public int insertReply(Reply r) {
		return studyDao.insertReply(sqlSession, r);
	}

	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return studyDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Study> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return studyDao.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public ArrayList<Study> selectSearchList(String keyword) {
		return studyDao.selectSearchList(sqlSession, keyword);
	}
}
