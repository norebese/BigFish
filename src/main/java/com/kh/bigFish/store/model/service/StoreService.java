package com.kh.bigFish.store.model.service;

import java.util.ArrayList;

import com.kh.bigFish.store.model.vo.Store;

public interface StoreService {
	
	
	ArrayList<Store> ajaxStoreList(Store s);
	
	Store resDetailPage(int num);
}
