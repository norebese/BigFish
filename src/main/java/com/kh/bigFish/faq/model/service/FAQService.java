package com.kh.bigFish.faq.model.service;

import java.util.ArrayList;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.faq.model.vo.FAQ;

public interface FAQService {
	int selectListCount();
	ArrayList<FAQ> selectList(PageInfo pi);
	int faqInsert(FAQ f);
	FAQ selectFaq(int faqNo);
	int updateFaq(FAQ f);
	int faqDelete(int faqNo);
}
