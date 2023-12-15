package com.kh.bigFish.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.store.model.vo.Slike;
import com.kh.bigFish.store.model.vo.Store;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

@Repository
public class StoreDao {

	public ArrayList<Store> ajaxStoreList(SqlSessionTemplate sqlSession, Store s, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		System.out.println(s);
		return (ArrayList)sqlSession.selectList("storeMapper.ajaxStoreList", s, rowBounds);
	}

	public Store resDetailPage(SqlSessionTemplate sqlSession, int num) {
		
		return sqlSession.selectOne("storeMapper.resDetailPage", num);
	}

	public int checkBusinessNo(SqlSessionTemplate sqlSession, String businessNo) {
		return sqlSession.selectOne("storeMapper.checkBusinessNo",businessNo);
	}
	
	public int insertStore(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.insert("storeMapper.insertStore",s);
	}
	
	public int insertTicket(SqlSessionTemplate sqlSession,Ticket t) {
		return sqlSession.insert("storeMapper.insertTicket",t);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("storeMapper.insertAttachment",a);
	}

	public ArrayList<Ticket> TicketTime(SqlSessionTemplate sqlSession, Ticket t) {
		return (ArrayList)sqlSession.selectList("storeMapper.TicketTime", t);
	}

	public int createLikeTable(SqlSessionTemplate sqlSession, int memNo, int storeNum) {
		Map<String, Object> params = new HashMap<>();
		params.put("memNo", memNo);
	    params.put("storeNum", storeNum);
		return sqlSession.insert("storeMapper.createLikeTable", params);
	}

	public Slike checkLikeTable(SqlSessionTemplate sqlSession, int memNo, int storeNum) {
		Map<String, Object> params = new HashMap<>();
		params.put("memNo", memNo);
	    params.put("storeNum", storeNum);
		return sqlSession.selectOne("storeMapper.checkLikeTable", params);
	}

	public int storeUpdateLike(SqlSessionTemplate sqlSession, Slike sk, String result) {
		Map<String, Object> params = new HashMap<>();
	    params.put("result", result);
	    params.put("rstoreNo", sk.getRstoreNo());
	    params.put("rmemNo", sk.getRmemNo());
	    
		return sqlSession.update("storeMapper.storeUpdateLike", params);
	}

	public Slike likeResult(SqlSessionTemplate sqlSession, Slike sk) {
		return sqlSession.selectOne("storeMapper.likeResult", sk);
	}

	public ArrayList<Store> storeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
				
		return (ArrayList)sqlSession.selectList("storeMapper.storeList", null, rowBounds);
	}

	public int storeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.storeCount");
	}

	public int filteredStoreCount(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.selectOne("storeMapper.filteredStoreCount", s);
	}

	public int seaStoreCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.seaStoreCount");
	}

	public ArrayList<Store> seaStoreList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("storeMapper.seaStoreList", null, rowBounds);
	}

	public int ajaxSeaStoreCount(SqlSessionTemplate sqlSession, String city1, String city2, String city3,
			String city4, String city5, String city6) {
		Map<String, Object> params = new HashMap<>();
	    params.put("city1", city1);
	    params.put("city2", city2);
	    params.put("city3", city3);
	    params.put("city4", city4);
	    params.put("city5", city5);
	    params.put("city6", city6);
		return sqlSession.selectOne("storeMapper.ajaxSeaStoreCount", params);
	}

	public ArrayList<Store> ajaxSeaStoreList(SqlSessionTemplate sqlSession, PageInfo pi, String city1, String city2,
			String city3, String city4, String city5, String city6) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> params = new HashMap<>();
	    params.put("city1", city1);
	    params.put("city2", city2);
	    params.put("city3", city3);
	    params.put("city4", city4);
	    params.put("city5", city5);
	    params.put("city6", city6);
		return (ArrayList)sqlSession.selectList("storeMapper.ajaxSeaStoreList", params, rowBounds);
	}

	public ArrayList<Store> ajaxSeaAreaMore(SqlSessionTemplate sqlSession, PageInfo pi, String city1, String city2,
			String city3, String city4, String city5, String city6) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> params = new HashMap<>();
	    params.put("city1", city1);
	    params.put("city2", city2);
	    params.put("city3", city3);
	    params.put("city4", city4);
	    params.put("city5", city5);
	    params.put("city6", city6);
		return (ArrayList)sqlSession.selectList("storeMapper.ajaxSeaStoreList", params, rowBounds);
	}

	public ArrayList<Store> selectMyStoreList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("storeMapper.selectMyStoreList",memNo);
	}

	public int ajaxSeaStoreCountF(SqlSessionTemplate sqlSession, String city1, String city2, String city3, String city4,
			String city5, String city6, int filterNum) {
		Map<String, Object> params = new HashMap<>();
	    params.put("city1", city1);
	    params.put("city2", city2);
	    params.put("city3", city3);
	    params.put("city4", city4);
	    params.put("city5", city5);
	    params.put("city6", city6);
	    params.put("filterNum", filterNum);
	    if(city1 =="") {
	    	return sqlSession.selectOne("storeMapper.ajaxSeaStoreCountFA", params);
	    }else {
	    	return sqlSession.selectOne("storeMapper.ajaxSeaStoreCountFB", params);
	    }
	}

	public ArrayList<Store> ajaxStoreKindFilter(SqlSessionTemplate sqlSession, PageInfo pi, String city1, String city2,
			String city3, String city4, String city5, String city6, int filterNum) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, Object> params = new HashMap<>();
	    params.put("city1", city1);
	    params.put("city2", city2);
	    params.put("city3", city3);
	    params.put("city4", city4);
	    params.put("city5", city5);
	    params.put("city6", city6);
	    params.put("filterNum", filterNum);
	    
	    if(city1 =="") {
	    	return (ArrayList)sqlSession.selectList("storeMapper.ajaxStoreKindFilterA", params, rowBounds);
	    }else {
	    	return (ArrayList)sqlSession.selectList("storeMapper.ajaxStoreKindFilterB", params, rowBounds);
	    }
	}
	
	public int storeEnroll(SqlSessionTemplate sqlSession,Store s) {
		return sqlSession.insert("storeMapper.storeEnroll",s);

	}

	public ArrayList<Store> myStoreList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.myStoreList", memNo);
	}

	public String detailInfo(SqlSessionTemplate sqlSession, int storeNum) {
		return sqlSession.selectOne("storeMapper.detailInfo", storeNum);
	}

	public int updateDetailInfo(SqlSessionTemplate sqlSession, int storeNum, String info) {
		Map<String, Object> params = new HashMap<>();
	    params.put("storeNum", storeNum);
	    params.put("info", info);
		
		return sqlSession.update("storeMapper.updateDetailInfo", params);
	}
	
	public Store getStoreInfo(SqlSessionTemplate sqlSession,int storeNo) {
		return sqlSession.selectOne("storeMapper.getStoreInfo",storeNo);
	}
	
	public ArrayList<Ticket> getAllTicketInfo(SqlSessionTemplate sqlSession, int rstoreNo){
		return (ArrayList)sqlSession.selectList("storeMapper.getAllTicketInfo", rstoreNo);
	}
	
	public ArrayList<Attachment> getStoreAtt(SqlSessionTemplate sqlSession, int rstoreNo){
		return (ArrayList)sqlSession.selectList("storeMapper.getStoreAtt", rstoreNo);
	}
	
	public int updateStore(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.update("storeMapper.updateStore",s);
	}
	
	public int updateStoreStatus(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.update("storeMapper.updateStoreStatus",s);
	}
	
	public int checkBusinessNoForDelete(SqlSessionTemplate sqlSession, String businessNo) {
		return sqlSession.selectOne("storeMapper.checkBusinessNoForDelete",businessNo);
	}
	
	public int businessDelete(SqlSessionTemplate sqlSession, String businessNo) {
		return sqlSession.update("storeMapper.businessDelete",businessNo);
	}

}
