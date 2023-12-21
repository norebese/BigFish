package com.kh.bigFish.chat.model.service;

import java.util.ArrayList;

import com.kh.bigFish.chat.model.vo.Chat;

public interface ChatService {

	
	
	public int insertChatMsg(Chat c);
	
	public ArrayList<Chat> getChat(Chat c);
	
	public ArrayList<Chat> getUserForChat(Chat c);
	
	public int readCheckPersonal(Chat c);
	
	public int updateReadPersonal(Chat c);
}
