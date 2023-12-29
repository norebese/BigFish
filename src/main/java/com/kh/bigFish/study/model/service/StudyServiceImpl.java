package com.kh.bigFish.study.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reply.model.vo.Reply;
import com.kh.bigFish.study.model.dao.StudyDao;
import com.kh.bigFish.study.model.vo.Study;
import com.kh.bigFish.study.model.vo.StudyGood;

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

	@Override
	public StudyGood likeResult(StudyGood sg) {
		System.out.println(sg + "111111");
		return studyDao.likeResult(sqlSession, sg);
	}

	@Override
	public int studyUpdateLike(StudyGood sg, String result) {
		return studyDao.studyUpdateLike(sqlSession, sg, result);
	}

	@Override
	public StudyGood checkLikeTable(int memNo, int rstudyNo) {
		return studyDao.checkLikeTable(sqlSession, memNo, rstudyNo);
	}

	@Override
	public int createLikeTable(int memNo, int sno) {
		return studyDao.createLikeTable(sqlSession, memNo, sno);
	}

	@Override
	public ArrayList<Study> selectStudyList(String keyword) {
		return studyDao.selectStudyList(sqlSession, keyword);
	}

	@Override
	public ArrayList<Study> selectmainList() {
		return studyDao.selectmainList(sqlSession);
	}

	@Override
	public int studyGoodCount(int sno) {
		return studyDao.studyGoodCount(sqlSession, sno);
	}

	@Override
	public int studyUpdateLike1(StudyGood sg) {
		return studyDao.studyUpdateLike1(sqlSession, sg);
	}
}
