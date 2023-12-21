package com.kh.bigFish.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.bigFish.chat.model.service.ChatService;
import com.kh.bigFish.chat.model.vo.Chat;
import com.kh.bigFish.member.model.service.MemberService;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reservation.model.service.ReservationService;
import com.kh.bigFish.reservation.model.vo.Reservation;
import com.kh.bigFish.store.model.service.StoreService;
import com.kh.bigFish.store.model.vo.Store;

@Controller
public class ChatController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("companyChat")
	public String companyChat(int storeNo, HttpSession session) {
		 

		session.setAttribute("storeNo", storeNo); 
		
		return "chat/companyChat";
	}
	
	
	@RequestMapping("personalChat")
	public String personalChat() {

		return "chat/personalChat";
	}
	
	@ResponseBody
	@RequestMapping(value="getRevStoreForChat", produces="application/json; charset=UTF-8")
	public String getRevStoreForChat(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		System.out.println("m : " + m);
		ArrayList<Reservation> r = reservationService.getRevStoreForChat(m.getMemNo());
		
		for(Reservation q : r) {
			System.out.println(q);
		}
		
		return new Gson().toJson(r);
	}
	
	@ResponseBody
	@RequestMapping(value="getChat", produces="application/json; charset=UTF-8")
	public String getChat(Chat c) {
		
		ArrayList<Chat> chatArr = chatService.getChat(c);
		
		return new Gson().toJson(chatArr);
	}
	
	@ResponseBody
	@RequestMapping(value="getUserForChat", produces="application/json; charset=UTF-8")
	public String getUserForChat(Chat c) {
		System.out.println(c);
		ArrayList<Chat> chatArr = chatService.getUserForChat(c);
		System.out.println("chatArr : " + chatArr);
		ArrayList<Member> mArr = new ArrayList<>();
		
		for(Chat ch : chatArr) {
			Member m = memberService.getMemberInfoForChat(ch);
			
			mArr.add(m);
		}
		
		System.out.println("mArr : " + mArr);
		
		return new Gson().toJson(mArr);
	}
	
	@ResponseBody
	@RequestMapping(value="readCheckPersonal")
	public String readCheckPersonal(String senderId, String receiverId) {
		
		Chat c = new Chat();
		c.setSenderId(senderId);
		c.setReceiverId(receiverId);
		
		int result = chatService.readCheckPersonal(c);
		
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "updateReadPersonal")
	public String updateReadPersonal(String senderId, String receiverId) {
		Chat c = new Chat();
		c.setSenderId(senderId);
		c.setReceiverId(receiverId);
		
		System.out.println("updateReadPersonal : "+ c);
		
		int result = chatService.updateReadPersonal(c);
		System.out.println("result : "+ result);
		return result+"";
		
	}
	
	@ResponseBody
	@RequestMapping(value="getUserNameInfoForChat", produces="text/html; charset=UTF-8")
	public String getUserNameInfoForChat(Member m) {
		
		Member mem = memberService.getUserNameInfoForChat(m);
		
		return mem.getMemNick();
	}
	
	@ResponseBody
	@RequestMapping(value="getStoreNameInfoForChat", produces="text/html; charset=UTF-8")
	public String getStoreNameInfoForChat(Store s) {
		
		Store sto = storeService.getStoreNameInfoForChat(s);
		
		return sto.getStoreName();
	}
	
}
