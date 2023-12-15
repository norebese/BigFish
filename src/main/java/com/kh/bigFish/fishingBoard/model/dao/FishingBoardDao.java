package com.kh.bigFish.fishingBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.announce.model.vo.Announce;
import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;

@Repository
public class FishingBoardDao {


	public int insertFishingBoard(SqlSessionTemplate sqlSession, FishingBoard b) {
		System.out.println("나는 행복합니다."+b);

		return sqlSession.insert("fishingBoardMapper.insertfishingBoard", b);

	}
	public int insertFishingBoardFile(SqlSessionTemplate sqlSession,Attachment at) {
		System.out.println("나는 행복합니다."+at);
		return sqlSession.insert("fishingBoardMapper.insertFishingBoardFile",at);
		//		return 1;

	}
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fishingBoardMapper.selectListCount");
	}

	public ArrayList<FishingBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("fishingBoardMapper.selectList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int fishingNo) {
		System.out.println(fishingNo);

		return sqlSession.update("fishingBoardMapper.increaseCount", fishingNo);
	}


	public FishingBoard selectBoard(SqlSessionTemplate sqlSession, int fishingNo) {
		
		return sqlSession.selectOne("fishingBoardMapper.selectBoard",fishingNo);
	}
	
	
	public int updateBoard(SqlSessionTemplate sqlSession, FishingBoard b) {
		System.out.println("내모습이보이지않아"+b);
		return sqlSession.update("fishingBoardMapper.updateBoard", b);
	}
	public int updateFileBoard(SqlSessionTemplate sqlSession, FishingBoard b) {
		System.out.println("내모습이보이지않아"+b);
		return sqlSession.update("fishingBoardMapper.updateFileBoard", b);
	}
	
public int deleteBoard(SqlSessionTemplate sqlSession, int fishingNo) {
		
		return sqlSession.update("fishingBoardMapper.deleteBoard", fishingNo);
	}

public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
	return sqlSession.selectOne("fishingBoardMapper.selectSearchListCount", map);	
}

public ArrayList<FishingBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset, limit);
	return (ArrayList)sqlSession.selectList("fishingBoardMapper.selectSearchList", map, rowBounds);
}

	//통합검색을 위해 만든 것 -고이환-
    public ArrayList<FishingBoard> selectFishingList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("fishingBoardMapper.selectFishingList", keyword);
    }
   

public ArrayList<FishingBoard> selectmainList(SqlSessionTemplate sqlSession) {
	return (ArrayList)sqlSession.selectList("fishingBoardMapper.selectmainList");
}


}
