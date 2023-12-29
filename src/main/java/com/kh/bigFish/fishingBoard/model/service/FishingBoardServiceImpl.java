package com.kh.bigFish.fishingBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fishingBoard.model.dao.FishingBoardDao;
import com.kh.bigFish.fishingBoard.model.vo.FiLike;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;
import com.kh.bigFish.freeBoard.model.vo.Flike;
import com.kh.bigFish.reply.model.vo.Reply;



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

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		return fishingBoardDao.selectReplyList(sqlSession, bno);
	}

	@Override
	public int insertReply(Reply r) {
		return fishingBoardDao.insertReply(sqlSession, r);
	}

	@Override
	public FiLike likeResult(FiLike fi) {
		return fishingBoardDao.likeResult(sqlSession, fi);
	}

	@Override
	public int fishUpdateLike(FiLike fi, String result) {
		int i =fishingBoardDao.fishUpdateLike(sqlSession, fi, result);
		System.out.println("지1234금찍는거"+fi+"12342314sksmsqkqh"+result+"12342314sksmsqkqh"+i);
		return i;
	}

	@Override
	public int fishUpdateLike1(FiLike fi) {
		int i =fishingBoardDao.fishUpdateLike1(sqlSession, fi);
		System.out.println("지금찍는거123432134"+fi+"12342314"+i);
		return i;
	}

	@Override
	public int fishGoodCount(int bno) {
		return fishingBoardDao.fishGoodCount(sqlSession, bno);
	}

	@Override
	public FiLike checkLikeTable(int memNo, int rfishingNo) {
		return fishingBoardDao.checkLikeTable(sqlSession, memNo, rfishingNo);
	}

	@Override
	public int createLikeTable(int memNo, int bno) {
		return fishingBoardDao.createLikeTable(sqlSession, memNo, bno);
	}
	
	
}
