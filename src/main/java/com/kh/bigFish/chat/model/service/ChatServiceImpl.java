package com.kh.bigFish.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.chat.model.dao.ChatDao;
import com.kh.bigFish.chat.model.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertChatMsg(Chat c) {
		return chatDao.insertChatMsg(sqlSession, c);
	}

	@Override
	public ArrayList<Chat> getChat(Chat c) {
		return chatDao.getChat(sqlSession, c);
	}

	@Override
	public ArrayList<Chat> getUserForChat(Chat c) {
		return chatDao.getUserForChat(sqlSession, c);
	}

	@Override
	public int readCheckPersonal(Chat c) {
		return chatDao.readCheckPersonal(sqlSession, c);
	}

	@Override
	public int updateReadPersonal(Chat c) {
		return chatDao.updateReadPersonal(sqlSession, c);
	}

}
