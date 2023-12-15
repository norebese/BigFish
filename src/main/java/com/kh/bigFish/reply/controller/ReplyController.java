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
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;
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

		PageInfo pi = Pagenation.getPageInfo(storeReplyCount, rPage, 5, 5);
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
		
		PageInfo pi = Pagenation.getPageInfo(storeReplyCount, 1, 5, 5);
		
		int sNum = st.getStoreNo();
		ArrayList<Reply> replyList = replyService.storeReplyList(pi, sNum);
		session.setAttribute("rNum", storeReplyCount);
		session.setAttribute("replyPi", pi);
		
		result.put("replyList", replyList);
	    result.put("rNum", storeReplyCount);
	    result.put("replyPi", pi);
	    
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxDltReply", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxDltReply(Reply R,HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		int rNum = Integer.parseInt(request.getParameter("rNum"));
		Store st = (Store) session.getAttribute("st");
		
		int deleteReply = replyService.deleteReply(rNum);
		
		R.setRstoreNo(st.getStoreNo());
		int storeReplyCount = replyService.storeReplyCount(R);
		
		PageInfo pi = Pagenation.getPageInfo(storeReplyCount, 1, 5, 5);
		
		int sNum = st.getStoreNo();
		ArrayList<Reply> replyList = replyService.storeReplyList(pi, sNum);
		
		result.put("replyList", replyList);
	    result.put("rNum", storeReplyCount);
	    result.put("replyPi", pi);
	    
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value="ajaxAddFreeReply", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxAddFreeReply(Reply R,HttpServletRequest request, HttpSession session,int freeNo) {
		Map<String, Object> result = new HashMap<>();
		Member Mem = (Member) session.getAttribute("loginUser");
		
		
		String contentValue = (String) request.getParameter("contentValue");
		
		R.setReplyWriter(Mem.getMemNick());
		R.setRmemNo(Mem.getMemNo());
		R.setReplyContent(contentValue);
		R.setRfreeNo(freeNo);
		
		int insertReply = replyService.insertFreeReply(R);
		
		int insertFreeReply = replyService.freeReplyCount(R);
		
		PageInfo pi = Pagenation.getPageInfo(insertFreeReply, 1, 5, 5);
		
//		int sNum = st.getStoreNo();
//		ArrayList<Reply> replyList = replyService.storeReplyList(pi, sNum);
		session.setAttribute("rNum", insertFreeReply);
		session.setAttribute("replyPi", pi);
		
//		result.put("replyList", replyList);
	    result.put("rNum", insertFreeReply);
	    result.put("replyPi", pi);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxDltFreeReply", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxDltReply(Reply R,HttpServletRequest request, HttpSession session,int freeNo) {
		Map<String, Object> result = new HashMap<>();
		int rNum = Integer.parseInt(request.getParameter("rNum"));
		Store st = (Store) session.getAttribute("st");
		
		
		int deleteReply = replyService.deleteFreeReply(rNum);
		
		R.setRfreeNo(freeNo);
		int storeReplyCount = replyService.freeReplyCount(R);
		
		PageInfo pi = Pagenation.getPageInfo(storeReplyCount, 1, 5, 5);
		
		int sNum = freeNo;
		ArrayList<Reply> replyList = replyService.freeReplyList(pi, sNum);
		
		result.put("replyList", replyList);
	    result.put("rNum", storeReplyCount);
	    result.put("replyPi", pi);
	    
		return result;
	}
	
	
}
