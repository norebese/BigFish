package com.kh.bigFish.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.store.model.dao.StoreDao;
import com.kh.bigFish.store.model.vo.Slike;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Store> ajaxStoreList(Store s, PageInfo pi) {
		return storeDao.ajaxStoreList(sqlSession, s, pi);
	}

	@Override
	public Store resDetailPage(int num) {
		return storeDao.resDetailPage(sqlSession, num);
	}
	
	@Override
	public int checkBusinessNo(String businessNo) {
		return storeDao.checkBusinessNo(sqlSession, businessNo);
	}

	@Override
	public int insertStore(Store s) {
		return storeDao.insertStore(sqlSession, s);
	}

	@Override
	public int insertTicket(Ticket t) {
		return storeDao.insertTicket(sqlSession, t);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return storeDao.insertAttachment(sqlSession, a);
	}

	@Override
	public ArrayList<Ticket> TicketTime(Ticket t) {
		return storeDao.TicketTime(sqlSession, t);
	}

	@Override
	public int createLikeTable(int memNo, int storeNum) {
		return storeDao.createLikeTable(sqlSession, memNo, storeNum);
	}

	@Override
	public Slike checkLikeTable(int memNo, int storeNum) {
		return storeDao.checkLikeTable(sqlSession, memNo, storeNum);
	}

	@Override
	public int storeUpdateLike(Slike sk, String result) {
		return storeDao.storeUpdateLike(sqlSession, sk, result);
	}

	@Override
	public Slike likeResult(Slike sk) {
		return storeDao.likeResult(sqlSession, sk);
	}

	@Override
	public ArrayList<Store> storeList(PageInfo pi) {
		return storeDao.storeList(sqlSession, pi);
	}

	@Override
	public int storeCount() {
		return storeDao.storeCount(sqlSession);
	}

	@Override
	public int filteredStoreCount(Store s) {
		return storeDao.filteredStoreCount(sqlSession, s);
	}

	@Override
	public int seaStoreCount() {
		return storeDao.seaStoreCount(sqlSession);
	}

	@Override
	public ArrayList<Store> seaStoreList(PageInfo pi) {
		return storeDao.seaStoreList(sqlSession, pi);
	}

	@Override
	public int ajaxSeaStoreCount(String City1, String City2, String City3, String City4, String City5, String City6) {
		return storeDao.ajaxSeaStoreCount(sqlSession, City1, City2, City3, City4, City5, City6);
	}

	@Override
	public ArrayList<Store> ajaxSeaStoreList(PageInfo pi, String City1, String City2, String City3, String City4, String City5, String City6) {
		return storeDao.ajaxSeaStoreList(sqlSession, pi, City1, City2, City3, City4, City5, City6);
	}

	@Override
	public ArrayList<Store> ajaxSeaAreaMore(PageInfo pi, String City1, String City2, String City3, String City4,
			String City5, String City6) {
		return storeDao.ajaxSeaAreaMore(sqlSession, pi, City1, City2, City3, City4, City5, City6);
	}

	@Override	
	public ArrayList<Store> selectMyStoreList(int memNo) {
		return storeDao.selectMyStoreList(sqlSession, memNo);
	}

	@Override
	public int ajaxSeaStoreCountF(String City1, String City2, String City3, String City4, String City5, String City6,
			int filterNum) {
		return storeDao.ajaxSeaStoreCountF(sqlSession, City1, City2, City3, City4, City5, City6, filterNum);
	}

	@Override
	public ArrayList<Store> ajaxStoreKindFilter(PageInfo pi, String City1, String City2, String City3, String City4,
			String City5, String City6, int filterNum) {
		return storeDao.ajaxStoreKindFilter(sqlSession, pi, City1, City2, City3, City4, City5, City6, filterNum);
	}
	
	@Override
	public int storeEnroll(Store s) {
		return storeDao.storeEnroll(sqlSession, s);
	}

	@Override
	public ArrayList<Store> myStoreList(int MemNo) {
		return storeDao.myStoreList(sqlSession, MemNo);
	}

	@Override
	public String detailInfo(int storeNum) {
		return storeDao.detailInfo(sqlSession, storeNum);
	}

	@Override
	public int updateDetailInfo(int storeNum, String info) {
		return storeDao.updateDetailInfo(sqlSession, storeNum, info);
	}

	@Override
	public Store getStoreInfo(int storeNo) {
		return storeDao.getStoreInfo(sqlSession, storeNo);
	}

	@Override
	public ArrayList<Ticket> getAllTicketInfo(int rstoreNo) {
		return storeDao.getAllTicketInfo(sqlSession, rstoreNo);
	}

	@Override
	public ArrayList<Attachment> getStoreAtt(int rstoreNo) {
		return storeDao.getStoreAtt(sqlSession, rstoreNo);
	}

	@Override
	public int updateStore(Store s) {
		return storeDao.updateStore(sqlSession, s);
	}

	@Override
	public int updateStoreStatus(Store s) {
		return storeDao.updateStoreStatus(sqlSession, s);
	}

	@Override
	public int checkBusinessNoForDelete(String businessNo) {
		return storeDao.checkBusinessNoForDelete(sqlSession, businessNo);
	}

	@Override
	public int businessDelete(String businessNo) {
		return storeDao.businessDelete(sqlSession, businessNo);
	}


	
}

