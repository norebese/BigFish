package com.kh.bigFish.study.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.reply.model.vo.Reply;
import com.kh.bigFish.study.model.vo.Study;

@Repository
public class StudyDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studyMapper.selectListCount");
	}
	
	public ArrayList<Study> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("studyMapper.selectList", null, rowBounds);
	}
	
	public int insertStudy(SqlSessionTemplate sqlSession, Study s) {
		return sqlSession.insert("studyMapper.insertStudy", s);
	}										
	
	public int increaseCount(SqlSessionTemplate sqlSession, int studyNo) {
		return sqlSession.update("studyMapper.increaseCount", studyNo);
	}
	
	public Study selectStudy(SqlSessionTemplate sqlSession, int studyNo) {
		return sqlSession.selectOne("studyMapper.selectStudy", studyNo);
	}
	
	public int deleteStudy(SqlSessionTemplate sqlSession, int studyNo) {
		return sqlSession.update("studyMapper.deleteStudy", studyNo);
	}
	
	public int updateStudy(SqlSessionTemplate sqlSession, Study s) {
		return sqlSession.update("studyMapper.updateStudy", s);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("studyMapper.selectReplyList", bno);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("studyMapper.insertReply", r);
	}
}
