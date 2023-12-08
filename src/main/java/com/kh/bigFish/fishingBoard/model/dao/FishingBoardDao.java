package com.kh.bigFish.fishingBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;

@Repository
public class FishingBoardDao {


	public int insertFishingBoard(SqlSessionTemplate sqlSession, FishingBoard b) {
		System.out.println("나는 행복합니다."+b);
		
 return sqlSession.insert("fishingBoardMapper.insertfishingBoard", b);
	
	}
	public int insertFishingBoardFile(SqlSessionTemplate sqlSession,Attachment at) {
		System.out.println("나는 불행합니다."+at);
		return sqlSession.insert("boardMapper.insertfishingBoard", b);
		
	}

}
