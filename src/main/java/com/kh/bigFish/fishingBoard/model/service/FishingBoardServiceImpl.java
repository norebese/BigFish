package com.kh.bigFish.fishingBoard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.fishingBoard.model.dao.FishingBoardDao;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;



@Service
public class FishingBoardServiceImpl  implements FishingBoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired 
	private FishingBoardDao fishingBoardDao;

	@Override
	public int insertFishingBoard(FishingBoard b) {
		return fishingBoardDao.insertFishingBoard(sqlSession, b);
	}

	@Override
	public int insertFishingBoardFile(Attachment at) {
		return fishingBoardDao.insertFishingBoardFile(sqlSession, at);
	}






}
