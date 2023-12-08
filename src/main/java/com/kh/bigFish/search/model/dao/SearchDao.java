package com.kh.bigFish.search.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.study.model.vo.Study;

@Repository
public class SearchDao {
	
	public ArrayList<Study> selectSearchList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("studyMapper.selectSearchList", keyword);
	}
}
