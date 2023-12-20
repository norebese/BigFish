package com.kh.bigFish.fish.model.service;

import java.util.ArrayList;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.fish.model.vo.Fish;
public interface FishService {
	
	int selectFreshListCount();
	
	ArrayList<Fish> selectFreshList(PageInfo pi);
	
	int selectSeaListCount();
	
	ArrayList<Fish> selectSeaList(PageInfo pi);
	
	int insertFishInfo(Fish f);
	
	int increaseCount(int fishNo);
	
	Fish selectFish(int fishNo);
	
	ArrayList<Fish> selectFishImageList();
}
