package com.kh.bigFish.chat;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.bigFish.chat.model.service.ChatService;
import com.kh.bigFish.chat.model.vo.Chat;
import com.kh.bigFish.chat.model.vo.ChatMsgVO;
import com.kh.bigFish.member.model.vo.Member;

@Component("chatServer")
public class ChatServer extends TextWebSocketHandler {
	
	private final Map<String, WebSocketSession> userSession = new ConcurrentHashMap();
	private final Map<String, WebSocketSession> storeSession = new ConcurrentHashMap();
	
	@Autowired
	private ChatService chatService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결 시
		
		System.out.println(session.getAttributes().get("storeNo"));
		System.out.println(session.getAttributes().get("loginUser"));
		
		Member m = (Member)session.getAttributes().get("loginUser");
		
		if(m.getBusinessStatus().equals("Y")) {
			
			
			int storeNo = (int)session.getAttributes().get("storeNo");
			
			System.out.println(storeNo+" 연결됨");
			storeSession.put(""+storeNo, session);
			
			
		
		}else {
			
			int memNo = m.getMemNo();
			
			System.out.println(memNo + " 연결됨");
			userSession.put(""+memNo, session);
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Member m = (Member)session.getAttributes().get("loginUser");
		
		if(m.getBusinessStatus().equals("Y")) {
			System.out.println("여긴가");
			// 메시지 전송 시
			int storeNo = (int)session.getAttributes().get("storeNo");
			JsonObject obj = new JsonParser().parse(message.getPayload()).getAsJsonObject();
			System.out.println("objobjobj : " + obj);
			// 발신 정보
			ChatMsgVO vo = new ChatMsgVO();
			
			vo.setMsg(obj.get("message").getAsString());
			vo.setSenderNo(""+storeNo);
			vo.setTime(new Date().toLocaleString());
			vo.setType(obj.get("type").getAsString());
			
			sendMessageToUser(obj.get("target").getAsString(),vo);
			
		
		}else {
			System.out.println("저긴가");
			
			int memNo = m.getMemNo();
			
			JsonObject obj = new JsonParser().parse(message.getPayload()).getAsJsonObject();
			
			ChatMsgVO vo = new ChatMsgVO();
			
			vo.setMsg(obj.get("message").getAsString());
			vo.setSenderNo(""+memNo);
			vo.setTime(new Date().toLocaleString());
			vo.setType(obj.get("type").getAsString());
			
			sendMessageToUser(obj.get("target").getAsString(), vo);
			
		}

	}
	
	private void sendMessageToUser(String targetNo, ChatMsgVO vo) {
		System.out.println(targetNo);
		System.out.println(vo);
		
		WebSocketSession targetSession;
		WebSocketSession mySession;
		
		if(vo.getType().equals("personal")) {
			targetSession = userSession.get(targetNo);
			mySession = storeSession.get(vo.getSenderNo());
			System.out.println("여기다.");
		}else {
			System.out.println("targetNo : " + targetNo);
			targetSession = storeSession.get(targetNo);
			System.out.println(storeSession);
			mySession = userSession.get(vo.getSenderNo());
			System.out.println("저기다.");
			System.out.println(storeSession.get(targetNo));
			
		}
	
		
		//target이 연결중일 경우 바로 보냄 아닐 경우, 데이터베이스에 저장
		if(targetSession != null && targetSession.isOpen()) {
			System.out.println("개인에서 사업장으로 보내기"+vo);
			String str = new Gson().toJson(vo);
			TextMessage msg = new TextMessage(str);
			
			try {
				mySession.sendMessage(msg);
				targetSession.sendMessage(msg);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			Chat c = new Chat();
			c.setType(vo.getType());
			c.setSendTime(vo.getTime());
			c.setMsgText(vo.getMsg());
			c.setReadCheck("Y");
			c.setSenderId(vo.getSenderNo());
			c.setReceiverId(targetNo);
			
			int result = chatService.insertChatMsg(c);
			
			if(result>0) {
				System.out.println("들어갔습니다.");
			}else {
				System.out.println("안들어갔습니다.");
			}
			
		}else {
			Chat c = new Chat();
			c.setType(vo.getType());
			c.setSendTime(vo.getTime());
			c.setMsgText(vo.getMsg());
			c.setReadCheck("N");
			c.setSenderId(vo.getSenderNo());
			c.setReceiverId(targetNo);
			
			int result = chatService.insertChatMsg(c);
			
			if(result>0) {
				System.out.println("들어갔습니다.");
			}else {
				System.out.println("안들어갔습니다.");
			}
			
			String str = new Gson().toJson(vo);
			TextMessage msg = new TextMessage(str);
			
			try {
				mySession.sendMessage(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			
		if(session.getAttributes().get("storeNo")!=null) {
			int storeNo = (int)session.getAttributes().get("storeNo");
			
			System.out.println(storeNo+" 연결 끊김");
			
			storeSession.remove(""+storeNo);
		}else {
			Member m = (Member)session.getAttributes().get("loginUser");
			int memNo = m.getMemNo();
			
			System.out.println(memNo+" 연결 끊김");
			
			userSession.remove(""+memNo);
		}
		
	}
	
	

}
