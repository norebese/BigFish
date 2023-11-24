package com.kh.bigFish.common.template;

import com.kh.bigFish.common.model.vo.PageInfo;

public class Pagenation {
	   public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
	      
	      int maxPage = (int)Math.ceil((double)listCount / boardLimit);
	      int startPage = (currentPage - 1) / pageLimit*pageLimit+1;
	      int endPage = startPage + pageLimit - 1;
	      endPage = endPage > maxPage ? maxPage : endPage;
	      
	      //*페이징바를 만들때 필요한 객체
	      PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	      return pi;
	   }
	}