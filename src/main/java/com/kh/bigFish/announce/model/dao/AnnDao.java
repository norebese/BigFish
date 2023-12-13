package com.kh.bigFish.announce.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.announce.model.vo.Announce;
import com.kh.bigFish.common.model.vo.PageInfo;

@Repository
public class AnnDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("annMapper.selectListCount");
	}
	
	public ArrayList<Announce> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("annMapper.selectList", null, rowBounds);
	}
	
	public int InsertAnn(SqlSessionTemplate sqlSession, Announce a) {
		return sqlSession.insert("annMapper.insertAnn", a);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int annCount) {
		return sqlSession.update("annMapper.increaseCount", annCount); 
	}
	
	public Announce selectAnnounce(SqlSessionTemplate sqlSession, int annNo) {
		return sqlSession.selectOne("annMapper.selectAnnounce", annNo);
	}
	
	public int updateAnnounce(SqlSessionTemplate sqlSession, Announce a) {
		return sqlSession.update("annMapper.updateAnnounce", a);
	}
	
	public int deleteAnn(SqlSessionTemplate sqlSession, int annNo) {
		return sqlSession.delete("annMapper.deleteAnn", annNo);
	}
	
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("annMapper.selectSearchListCount", map);	
	}
	
	public ArrayList<Announce> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("annMapper.selectSearchList", map, rowBounds);
	}

}
	