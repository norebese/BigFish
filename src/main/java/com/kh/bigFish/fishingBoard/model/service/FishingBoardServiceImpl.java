package com.kh.bigFish.fishingBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
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

	@Override
	public int selectListCount() {
		return fishingBoardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<FishingBoard> selectList(PageInfo pi) {
		return fishingBoardDao.selectList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int fishingNo) {
		
		return fishingBoardDao.increaseCount(sqlSession, fishingNo);
	}

	@Override
	public FishingBoard selectBoard(int fishingNo) {
		return fishingBoardDao.selectBoard(sqlSession, fishingNo);
	}

	@Override
	public int updateBoard(FishingBoard b) {
		return fishingBoardDao.updateBoard(sqlSession, b);	
		}

	@Override
	public int updateFileBoard(FishingBoard b) {
		return fishingBoardDao.updateFileBoard(sqlSession, b);
	}

	@Override
	public int deleteBoard(int fishingNo) {
		return fishingBoardDao.deleteBoard(sqlSession, fishingNo);
	}

	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return fishingBoardDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<FishingBoard> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return fishingBoardDao.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public ArrayList<FishingBoard> selectmainList() {
		return fishingBoardDao.selectmainList(sqlSession);
	}
	
	//통합검색을 위해 만든 것 -고이환-
	@Override
	public ArrayList<FishingBoard> selectFishingList(String keyword) {
		return fishingBoardDao.selectFishingList(sqlSession, keyword);
	}
}
