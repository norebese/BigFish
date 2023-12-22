package com.kh.bigFish.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.chat.model.vo.Chat;

@Repository
public class ChatDao {
	
	public int insertChatMsg(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.insert("chatMapper.insertChatMsg", c);
	}
	
	public ArrayList<Chat> getChat(SqlSessionTemplate sqlSession, Chat c){
		return (ArrayList)sqlSession.selectList("chatMapper.getChat", c);
	}
	
	public ArrayList<Chat> getUserForChat(SqlSessionTemplate sqlSession, Chat c){
		return (ArrayList)sqlSession.selectList("chatMapper.getUserForChat", c);
	}
	
	public int readCheckPersonal(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.selectOne("chatMapper.readCheckPersonal", c);
	}
	
	public int updateReadPersonal(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.update("chatMapper.updateReadPersonal", c);
	}
}
