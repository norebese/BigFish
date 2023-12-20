package com.kh.bigFish.fish.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fish.model.vo.Fish;

@Repository
public class FishDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fishMapper.selectListCount");
	}
	
	public ArrayList<Fish> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("fishMapper.selectList", null, rowBounds);
	}
	
	public int insertFishInfo(SqlSessionTemplate sqlSession, Fish f) {
		return sqlSession.insert("fishMapper.insertFishInfo", f);
	}
	
}
