package com.kh.bigFish.reply.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.reply.model.service.ReplyService;
import com.kh.bigFish.reply.model.vo.Reply;
import com.kh.bigFish.store.model.vo.Store;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@ResponseBody
	@RequestMapping(value="ajaxPageReply", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxPageReply(Reply R,HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		Store st = (Store) session.getAttribute("st");
		int rPage = Integer.parseInt(request.getParameter("rPage"));

		R.setRstoreNo(st.getStoreNo());
		
		int storeReplyCount = replyService.storeReplyCount(R);

		PageInfo pi = Pagenation.getPageInfo(storeReplyCount, rPage, 10, 5);
		
		int sNum = st.getStoreNo();
		ArrayList<Reply> replyList = replyService.storeReplyList(pi, sNum);
		session.setAttribute("rNum", storeReplyCount);
		
		result.put("replyList", replyList);
	    result.put("replyPi", pi);
	    
		return result;
	}

	@ResponseBody
	@RequestMapping(value="ajaxAddReply", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxAddReply(Reply R,HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		Member Mem = (Member) session.getAttribute("loginUser");
		Store st = (Store) session.getAttribute("st");
		String contentValue = (String) request.getParameter("contentValue");
		
		R.setReplyWriter(Mem.getMemNick());
		R.setRmemNo(Mem.getMemNo());
		R.setReplyContent(contentValue);
		R.setRstoreNo(st.getStoreNo());
		int insertReply = replyService.insertReply(R);
		
		int storeReplyCount = replyService.storeReplyCount(R);
		
		PageInfo pi = Pagenation.getPageInfo(storeReplyCount, 1, 10, 5);
		System.out.println(pi);
		int sNum = st.getStoreNo();
		ArrayList<Reply> replyList = replyService.storeReplyList(pi, sNum);
		session.setAttribute("rNum", storeReplyCount);
		session.setAttribute("replyPi", pi);
		
		result.put("replyList", replyList);
	    result.put("rNum", storeReplyCount);
	    result.put("replyPi", pi);
	    
		return result;
	}
	
	
	
}
