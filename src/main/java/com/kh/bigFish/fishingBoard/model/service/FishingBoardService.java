package com.kh.bigFish.fishingBoard.model.service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.fishingBoard.model.vo.FishingBoard;

public interface FishingBoardService {

	//게시글 작성 서비스(insert)
		int insertFishingBoard(FishingBoard b);
		int insertFishingBoardFile(	Attachment at);
}
