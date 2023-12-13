package com.kh.bigFish.freeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.freeBoard.model.dao.FreeBoardDao;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;

@Service
public class FreeBoardServiceImpl  implements FreeBoardService {
	
	@Autowired
	private FreeBoardDao freeBoardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFreeBoard(FreeBoard b) {
		 int result = freeBoardDao.insertFreeBoard(sqlSession, b);
	
			
				
			return result;
	}

	@Override
	public ArrayList<FreeBoard> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectList(sqlSession, pi);
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return freeBoardDao.selectListCount(sqlSession);
	}

	@Override
	public int increaseCount(int freeNo) {
		// TODO Auto-generated method stub
		return freeBoardDao.increaseCount(sqlSession, freeNo);
	}

	@Override
	public FreeBoard selectBoard(int freeNo) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectBoard(sqlSession, freeNo);
	}

	@Override
	public int updateFreeBoard(FreeBoard b) {
	
		return freeBoardDao.updateFreeBoard(sqlSession, b);
	}

	//통합검색을 위해 만든 것 -고이환-
	@Override
	public ArrayList<FreeBoard> selectFreeList(String keyword) {
		return freeBoardDao.selectFreeList(sqlSession, keyword);

	@Override
	public int deleteBoard(int boardNo) {
		return freeBoardDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return freeBoardDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<FreeBoard> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return freeBoardDao.selectSearchList(sqlSession, map, pi);
	}
}
