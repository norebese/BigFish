package com.kh.bigFish.fishingBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fishingBoard.model.vo.FiLike;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;
import com.kh.bigFish.freeBoard.model.vo.Flike;
import com.kh.bigFish.reply.model.vo.Reply;

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
public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
	 ArrayList<Reply> A = (ArrayList)sqlSession.selectList("replyMapper.selectfreeReplyList", bno);
	
	return A;
}
public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
	return sqlSession.insert("replyMapper.insertfiReply", r);
}
public FiLike likeResult(SqlSessionTemplate sqlSession, FiLike fi) {
	return sqlSession.selectOne("fishingBoardMapper.likeResult", fi);
}
public int fishUpdateLike(SqlSessionTemplate sqlSession, FiLike sk, String result) {
	
		Map<String, Object> params = new HashMap<>();
	    params.put("result", result);
	    params.put("fishingNo", sk.getRfishingNo());
	    params.put("rmemNo", sk.getRmemNo());
	    System.out.println(params+"525212342134"+sk);
		return sqlSession.update("fishingBoardMapper.fishUpdateLike", params);
	}
public int fishUpdateLike1(SqlSessionTemplate sqlSession, FiLike sk) {
	
	Map<String, Object> params = new HashMap<>();

    params.put("fishingNo", sk.getRfishingNo());
    params.put("rmemNo", sk.getRmemNo());
    System.out.println("좋아요 숫자4321"+params);
    int i =sqlSession.selectOne("fishingBoardMapper.fishUpdateLike1", params);
    
    System.out.println("좋아요 숫자"+i);
	return i;
}
public int fishGoodCount(SqlSessionTemplate sqlSession, int bno) {
	System.out.println("qkqhqkqhqkqh 바보바ㅗ바보"+bno);
	int o =sqlSession.selectOne("fishingBoardMapper.fishGoodCount",bno);
	System.out.print("444444"+o);
	return sqlSession.selectOne("fishingBoardMapper.fishGoodCount",bno);
}
public FiLike checkLikeTable(SqlSessionTemplate sqlSession, int memNo, int rfishingNo) {
	Map<String, Object> params = new HashMap<>();
	
	params.put("memNo", memNo);
	params.put("bno", rfishingNo);
	return sqlSession.selectOne("fishingBoardMapper.checkLikeTable", params);
}
public int createLikeTable(SqlSessionTemplate sqlSession, int memNo, int bno) {
	Map<String, Object> params = new HashMap<>();
	params.put("memNo", memNo);
    params.put("bno", bno);
    System.out.println(params+"바보니?");
	return sqlSession.insert("fishingBoardMapper.createLikeTable", params);
}


}
