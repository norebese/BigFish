package com.kh.bigFish.fish.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fish.model.vo.Fish;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;

@Repository
public class FishDao {
	
	public int selectFreshListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fishMapper.selectFreshListCount");
	}
	
	public ArrayList<Fish> selectFreshList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("fishMapper.selectFreshList", null, rowBounds);
	}
	
	public int selectSeaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fishMapper.selectSeaListCount");
	}
	
	public ArrayList<Fish> selectSeaList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("fishMapper.selectSeaList", null, rowBounds);
	}
	
	public int insertFishInfo(SqlSessionTemplate sqlSession, Fish f) {
		return sqlSession.insert("fishMapper.insertFishInfo", f);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int fishNo) {
		return sqlSession.update("fishMapper.increaseCount", fishNo);
	}
	
	public Fish selectFish(SqlSessionTemplate sqlSession, int fishNo) {
		return sqlSession.selectOne("fishMapper.selectFish", fishNo);
	}
	
	public ArrayList<Fish> selectFishImageList(SqlSessionTemplate sqlSession){
		ArrayList<Fish>  arr =(ArrayList)sqlSession.selectList("fishMapper.selectFishImageList");
		return arr;
	}
	
}
