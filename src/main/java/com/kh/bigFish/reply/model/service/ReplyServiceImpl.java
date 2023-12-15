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

	@Override
	public int deleteReply(int rNum) {
		return replyDao.deleteReply(sqlSession, rNum);
	}

	@Override
	public int insertFreeReply(Reply R) {
		return replyDao.insertFreeReply(sqlSession, R);
	}

	@Override
	public int freeReplyCount(Reply R) {
		return replyDao.freeReplyCount(sqlSession, R);
	}

	@Override
	public int deleteFreeReply(int rNum) {
		return replyDao.deleteFreeReply(sqlSession, rNum);
	}

	@Override
	public ArrayList<Reply> freeReplyList(PageInfo pi, int sNum) {
		return replyDao.freeReplyList(sqlSession, pi, sNum);
	}

}
