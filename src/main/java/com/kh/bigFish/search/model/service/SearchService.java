package com.kh.bigFish.search.model.service;

import java.util.ArrayList;

import com.kh.bigFish.study.model.vo.Study;

public interface SearchService {
 
	ArrayList<Study> selectSearchList(String keyword);
	
}
