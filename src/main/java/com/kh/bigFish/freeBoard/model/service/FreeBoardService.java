package com.kh.bigFish.freeBoard.model.service;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.freeBoard.model.vo.FreeBoard;




public interface FreeBoardService {

	
	//게시글 작성 서비스(insert)
		int insertFreeBoard(FreeBoard b);
	
}
