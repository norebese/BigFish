package com.kh.bigFish.freeBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;

@Repository
public class FreeBoardDao {



	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("freeBoardMapper.selectListCount");
	}


	public int insertFreeBoard(SqlSessionTemplate sqlSession, FreeBoard b) {

		return sqlSession.insert("freeBoardMapper.insertFreeBoard", b);
	}

	public ArrayList<FreeBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("freeBoardMapper.selectList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int freeNo) {

		return sqlSession.update("freeBoardMapper.increaseCount", freeNo);
	}
	public FreeBoard selectBoard(SqlSessionTemplate sqlSession, int freeNo) {

		return sqlSession.selectOne("freeBoardMapper.selectBoard",freeNo);
	}
	
	
	public int updateFreeBoard(SqlSessionTemplate sqlSession, FreeBoard b) {
	
		return sqlSession.update("freeBoardMapper.updateFreeBoard", b);
	}

	//통합검색을 위해 만든 것 -고이환-
	public ArrayList<FreeBoard> selectFreeList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("freeBoardMapper.selectFreeList", keyword);
	}	
	
public int deleteBoard(SqlSessionTemplate sqlSession, int freeNo) {
		
		return sqlSession.update("freeBoardMapper.deleteBoard", freeNo);
	}


public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
	return sqlSession.selectOne("freeBoardMapper.selectSearchListCount", map);	
}

public ArrayList<FreeBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset, limit);
	return (ArrayList)sqlSession.selectList("freeBoardMapper.selectSearchList", map, rowBounds);
}

}
