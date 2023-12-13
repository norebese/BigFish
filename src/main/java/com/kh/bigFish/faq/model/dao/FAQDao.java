package com.kh.bigFish.faq.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.faq.model.vo.FAQ;

@Repository
public class FAQDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("faqMapper.selectListCount");
	}
	
	public ArrayList<FAQ> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("faqMapper.selectList");
	}
	
	public int faqInsert(SqlSessionTemplate sqlSession, FAQ f) {
		return sqlSession.insert("faqMapper.faqInsert", f);
	}
	
	public FAQ selectFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.selectOne("faqMapper.selectFaq", faqNo);
	} 
	
	public int updateFaq(SqlSessionTemplate sqlSession, FAQ f) {
		return sqlSession.update("faqMapper.updateFaq", f);
	}
	
	public int faqDelete(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.update("faqMapper.faqDelete", faqNo);
	}
}
