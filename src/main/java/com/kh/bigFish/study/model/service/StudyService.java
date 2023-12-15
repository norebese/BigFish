package com.kh.bigFish.study.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.bigFish.announce.model.vo.Announce;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.reply.model.vo.Reply;
import com.kh.bigFish.study.model.vo.Study;
import com.kh.bigFish.study.model.vo.StudyGood;

public interface StudyService {
	
	//게시글 총 갯수 가져오기
	int selectListCount();
	
	//게시글 리스트 조회
	ArrayList<Study> selectList(PageInfo pi);
	
	//게시글 작성 서비스
	int insertStudy(Study s);
	
	//게시글 조회 수 증가
	int increaseCount(int studyNo);
	
	//게시글 상세조회
	Study selectStudy(int studyNo);
	
	//게시글 삭제
	int deleteStudy(int studyNo);
	
	//게시글 수정
	int updateStudy(Study s);
	
	//댓글 리스트 조회
	ArrayList<Reply> selectReplyList(int sno);
	
	//댓글 작성
	int insertReply(Reply r);
	
	//검색 결과 리스트
	int selectSearchListCount(HashMap<String, String> map);
	ArrayList<Study> selectSearchList(HashMap<String, String> map, PageInfo pi);

	ArrayList<Study> selectSearchList(String keyword);
	
	StudyGood likeResult(StudyGood sg);

	int studyUpdateLike(StudyGood sg, String result);
	
	
	StudyGood checkLikeTable(int memNo, int sno);

	int createLikeTable(int memNo, int sno);
	 
	ArrayList<Study> selectStudyList(String keyword);
}
