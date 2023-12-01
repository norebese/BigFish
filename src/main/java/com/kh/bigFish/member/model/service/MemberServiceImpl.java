package com.kh.bigFish.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bigFish.member.model.dao.MemberDao;
import com.kh.bigFish.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int checkEmailId(String emailId) {
		return memberDao.checkEmailId(sqlSession, emailId);
	}

	@Override
	public int insertPersonalMember(Member m) {
		return memberDao.insertPersonalMember(sqlSession, m);
	}

	@Override
	public int checkNick(String memNick) {
		return memberDao.checkNick(sqlSession, memNick);
	}
}
