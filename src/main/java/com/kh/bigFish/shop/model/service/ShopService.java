package com.kh.bigFish.shop.model.service;

import java.util.ArrayList;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.shop.model.vo.KakaoRequestDto;
import com.kh.bigFish.shop.model.vo.Shop;

public interface ShopService {

	//게시글 총 갯수 가져오기
	int selectListCount();
	
	//게시글 리스트 조회
	ArrayList<Shop> selectList(PageInfo pi);

	int insertShopFile(Attachment at);

	int insertShop(Shop s);

	Shop selectShop(int sno);

	int updateShop(Shop s);

	int updateFileShop(Shop s);

	int deleteShop(int sno);
	
	int insertParameter(String parameter);
	
	int updatePg_token(String j);
	
	ArrayList<KakaoRequestDto> selectKakaoRequestDtoList(String MemId);
}
