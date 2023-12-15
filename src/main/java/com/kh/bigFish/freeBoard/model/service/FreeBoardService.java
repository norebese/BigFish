package com.kh.bigFish.freeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.freeBoard.model.vo.Flike;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;
import com.kh.bigFish.store.model.vo.Slike;




public interface FreeBoardService {

	//게시글 총 갯수 가져오기
	int selectListCount();

	//게시글 작성 서비스(insert)
	int insertFreeBoard(FreeBoard b);

	//게시글 리스트 조회
	ArrayList<FreeBoard> selectList(PageInfo pi);

	//게시글 조회수 증가(update)
	int increaseCount(int freeNo);
	
	//좋아요 갯수
	int freeGoodCount(int bno);

	//게시글 상세조회(select)
	FreeBoard selectBoard(int freeNo);

	//게시글 수정 서비스(update)
	int updateFreeBoard(FreeBoard b);

	//게시글 삭제서비스(update)
	int deleteBoard(int boardNo);

	//게시글 검색서비스(update)
	int selectSearchListCount(HashMap<String, String> map);

	ArrayList<FreeBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);




	//최근작성된 board 3개 가져오기
	ArrayList<FreeBoard> selectmainList();

	Flike checkLikeTable(int memNo, int bno);
	
	int createLikeTable(int memNo, int bno);
	
	Flike likeResult(Flike fr);
	
	int freeUpdateLike(Flike fr, String result);

	//통합검색을 위해 만든 것 -고이환-
	ArrayList<FreeBoard> selectFreeList(String keyword);


}
