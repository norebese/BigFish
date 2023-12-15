package com.kh.bigFish.reply.model.service;

import java.util.ArrayList;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.reply.model.vo.Reply;

public interface ReplyService {
	
	int insertReply(Reply R);
	
	int insertFreeReply(Reply R);
	
	int storeReplyCount(Reply R);
	
	ArrayList<Reply> storeReplyList(PageInfo pi, int sNum);
	
	int deleteReply(int rNum);
	
	int freeReplyCount(Reply R);
	
	int deleteFreeReply(int rNum);
	
	
	ArrayList<Reply> freeReplyList(PageInfo pi, int sNum);
}
