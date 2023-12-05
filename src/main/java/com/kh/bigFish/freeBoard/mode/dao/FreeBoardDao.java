package com.kh.bigFish.freeBoard.mode.dao;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;

@Repository
public class FreeBoardDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("frddBoardMapper.selectListCount");
	}
	
	
	public int insertFreeBoard(SqlSessionTemplate sqlSession, FreeBoard b) {
			
			return sqlSession.insert("freeBoardMapper.insertFreeBoard", b);
		}
	

}
