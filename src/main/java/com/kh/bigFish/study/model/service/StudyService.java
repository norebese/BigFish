package com.kh.bigFish.study.model.service;

import java.util.ArrayList;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.study.model.vo.Study;

public interface StudyService {
	
	int selectListCount();
	
	ArrayList<Study> selectList(PageInfo pi);
	
	int insertStudy(Study s);
	
	int increaseCount(int studyNo);

	Study selectStudy(int studyNo);
	
	int deleteStudy(int studyNo);
	
	int updateStudy(Study s);
}
