package com.kh.bigFish.store.model.service;


import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.store.model.vo.Slike;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;
import java.util.ArrayList;


public interface StoreService {
	
	// 중복 사업자 번호 체크
	int checkBusinessNo(String businessNo);
	
	// 사업장 추가
	int insertStore(Store s);
	
	// 사업장 추가 시 티켓 추가
	int insertTicket(Ticket t);
	
	// 사업장 추가 시 사진 추가
	int insertAttachment(Attachment a);
	
	int storeCount();
	
	int filteredStoreCount(Store s);

	ArrayList<Store> ajaxStoreList(Store s, PageInfo pi);
	
	Store resDetailPage(int num);
	
	ArrayList<Ticket> TicketTime(Ticket t);
	
	int createLikeTable(int memNo, int storeNum);
	
	Slike checkLikeTable(int memNo, int storeNum);
	
	Slike likeResult(Slike sk);
	
	int storeUpdateLike(Slike sk, String result);
	
	ArrayList<Store> storeList(PageInfo pi);
	
	int seaStoreCount();
	
	ArrayList<Store> seaStoreList(PageInfo pi);
	
	int ajaxSeaStoreCount(String City1, String City2, String City3, String City4, String City5, String City6);
	
	ArrayList<Store> ajaxSeaStoreList(PageInfo pi, String City1, String City2, String City3, String City4, String City5, String City6);
	
	ArrayList<Store> ajaxSeaAreaMore(PageInfo pi, String City1, String City2, String City3, String City4, String City5, String City6);
	
	ArrayList<Store> selectMyStoreList(int memNo);
	
	int ajaxSeaStoreCountF(String City1, String City2, String City3, String City4, String City5, String City6, int filterNum);
	
	ArrayList<Store> ajaxStoreKindFilter(PageInfo pi, String City1, String City2, String City3, String City4, String City5, String City6, int filterNum);
	
	int storeEnroll(Store s);
	
	ArrayList<Store> myStoreList(int MemNo);
	
	String detailInfo(int storeNum);
	
	int updateDetailInfo(int storeNum, String info);
	
	Store getStoreInfo(int storeNo);
	
	ArrayList<Ticket> getAllTicketInfo(int rstoreNo);
	
	ArrayList<Attachment> getStoreAtt(int rstoreNo);
	
	int updateStore(Store s);
	
	int updateStoreStatus(Store s);
	
	int checkBusinessNoForDelete(String businessNo);
	
	int businessDelete(String businessNo);
}


