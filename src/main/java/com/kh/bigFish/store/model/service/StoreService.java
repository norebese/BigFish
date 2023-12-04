package com.kh.bigFish.store.model.service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.store.model.vo.Store;
import com.kh.bigFish.store.model.vo.Ticket;

public interface StoreService {
	
	// 중복 사업자 번호 체크
	int checkBusinessNo(String businessNo);
	
	// 사업장 추가
	int insertStore(Store s);
	
	// 사업장 추가 시 티켓 추가
	int insertTicket(Ticket t);
	
	// 사업장 추가 시 사진 추가
	int insertAttachment(Attachment a);
	
}
