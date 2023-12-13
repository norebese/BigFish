package com.kh.bigFish.reply.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.reply.model.vo.Reply;

@Repository
public class ReplyDao {

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.insertReplyStore", r);
	}

	public int storeReplyCount(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("replyMapper.storeReplyCount", r);
	}

	public ArrayList<Reply> storeReplyList(SqlSessionTemplate sqlSession, PageInfo pi, int sNum) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
				
		return (ArrayList)sqlSession.selectList("replyMapper.storeReplyList", sNum, rowBounds);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rNum) {
		return sqlSession.update("replyMapper.deleteReply", rNum);
	}
	
	

}
