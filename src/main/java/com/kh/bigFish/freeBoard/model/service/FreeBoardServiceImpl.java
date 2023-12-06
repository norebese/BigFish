package com.kh.bigFish.freeBoard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.freeBoard.mode.dao.FreeBoardDao;
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
}
