package com.kh.bigFish.fishingBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fishingBoard.model.vo.FiLike;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;
import com.kh.bigFish.freeBoard.model.vo.Flike;
import com.kh.bigFish.reply.model.vo.Reply;

public interface FishingBoardService {

	//게시글 작성 서비스(insert)
	int insertFishingBoard(FishingBoard b);
	int insertFishingBoardFile(	Attachment at);

	//게시글 총 갯수 가져오기
	int selectListCount();

	//게시글 리스트 조회
	ArrayList<FishingBoard> selectList(PageInfo pi);


	//게시글 조회수 증가(update)
	int increaseCount(int fishingNo);

	//게시글 상세조회(select)
	FishingBoard selectBoard(int fishingNo);

	//게시글 수정 서비스(update)
	int updateBoard(FishingBoard b);

	//게시글 수정 서비스(update)
	int updateFileBoard(FishingBoard b);

	//게시글 삭제서비스(update)

	int deleteBoard(int boardNo);
		
	//게시글 검색서비스(update)
	int selectSearchListCount(HashMap<String, String> map);
	ArrayList<FishingBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	//통합검색을 위해 만든 것 -고이환-
	ArrayList<FishingBoard> selectFishingList(String keyword);

	//최근작성된 board 3개 가져오기
	ArrayList<FishingBoard> selectmainList();
	
	//댓글 리스트 조회
			ArrayList<Reply> selectReplyList(int bno);
			//댓글 작성
			int insertReply(Reply r);
			
   //좋아요 
			FiLike likeResult(FiLike fi);
			int fishUpdateLike(FiLike fi, String result);
			int fishUpdateLike1(FiLike fi);
			//좋아요 갯수
			int fishGoodCount(int bno);
			FiLike checkLikeTable(int memNo, int bno);
			int createLikeTable(int memNo, int bno);



}
