package com.kh.bigFish.reply.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.reply.model.dao.ReplyDao;
import com.kh.bigFish.reply.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReply(Reply R) {
		return replyDao.insertReply(sqlSession, R);
	}

	@Override
	public int storeReplyCount(Reply R) {
		return replyDao.storeReplyCount(sqlSession, R);
	}

	@Override
	public ArrayList<Reply> storeReplyList(PageInfo pi, int sNum) {
		return replyDao.storeReplyList(sqlSession, pi, sNum);
	}

}
