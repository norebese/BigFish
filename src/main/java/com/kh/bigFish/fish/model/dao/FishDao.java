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
	
	public ArrayList<Fish> selectFreshFishImageList(SqlSessionTemplate sqlSession){
		ArrayList<Fish>  arr =(ArrayList)sqlSession.selectList("fishMapper.selectFreshFishImageList");
		return arr;
	}
	
	public ArrayList<Fish> selectSeaFishImageList(SqlSessionTemplate sqlSession){
		ArrayList<Fish>  arr =(ArrayList)sqlSession.selectList("fishMapper.selectSeaFishImageList");
		return arr;
	}
	
	public int updateFish(SqlSessionTemplate sqlSession, Fish f) {
		return sqlSession.update("fishMapper.updateFish", f);
	}
	
	public int deleteFish(SqlSessionTemplate sqlSession, int fishNo) {
		return sqlSession.delete("fishMapper.deleteFish", fishNo);
	}
	
}
