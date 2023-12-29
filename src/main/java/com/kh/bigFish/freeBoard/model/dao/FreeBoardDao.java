package com.kh.bigFish.freeBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.freeBoard.model.vo.Flike;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;
import com.kh.bigFish.reply.model.vo.Reply;
import com.kh.bigFish.store.model.vo.Slike;

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
	public ArrayList<FreeBoard> selectmainList(SqlSessionTemplate sqlSession) {

		ArrayList<FreeBoard>  ARR =(ArrayList)sqlSession.selectList("freeBoardMapper.selectmainList");

		return ARR;
	}

	public Flike checkLikeTable(SqlSessionTemplate sqlSession, int memNo, int rfreeNo) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("memNo", memNo);
		params.put("bno", rfreeNo);
		return sqlSession.selectOne("freeBoardMapper.checkLikeTable", params);
	}
	public int createLikeTable(SqlSessionTemplate sqlSession, int memNo, int bno) {
		Map<String, Object> params = new HashMap<>();
		params.put("memNo", memNo);
	    params.put("bno", bno);
		return sqlSession.insert("freeBoardMapper.createLikeTable", params);
	}
	
	public Flike likeResult(SqlSessionTemplate sqlSession, Flike fr) {
		return sqlSession.selectOne("freeBoardMapper.likeResult", fr);
	}
	
	public int freeUpdateLike(SqlSessionTemplate sqlSession, Flike sk, String result) {
	System.out.println(result+"12342134"+sk);
		Map<String, Object> params = new HashMap<>();
	    params.put("result", result);
	    params.put("freeNo", sk.getRfreeNo());
	    params.put("rmemNo", sk.getRmemNo());
	    
		return sqlSession.update("freeBoardMapper.freeUpdateLike", params);
	}
	
	
	public int freeGoodCount(SqlSessionTemplate sqlSession, int bno) {
		System.out.println("qkqhqkqhqkqh 바보바ㅗ바보"+bno);
		int o =sqlSession.selectOne("freeBoardMapper.freeGoodCount",bno);
		System.out.print("444444"+o);
		return sqlSession.selectOne("freeBoardMapper.freeGoodCount",bno);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("replyMapper.selectfrReplyList", bno);
	}
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		System.out.println("4324234gkgk"+r);
		return sqlSession.insert("replyMapper.insertfreeReply", r);
	}
	
	public int freeUpdateLike1(SqlSessionTemplate sqlSession, Flike sk) {
		
			Map<String, Object> params = new HashMap<>();
		
		    params.put("rfreeNo", sk.getRfreeNo());
		    params.put("rmemNo", sk.getRmemNo());
		    int i =sqlSession.selectOne("freeBoardMapper.freeUpdateLike1", params);
		    
		    System.out.println("좋아요 숫자"+i);
			return i;
		}
	
	
	
	public int deleteReply(SqlSessionTemplate sqlSession,int replyNo) {
		return sqlSession.update("freeBoardMapper.deleteReply", replyNo);
	}
	

}
