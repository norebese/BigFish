package com.kh.bigFish.freeBoard.model.service;

import java.util.ArrayList;

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
}
