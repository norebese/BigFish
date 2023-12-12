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

	@Override
	public int insertCompanyMember(Member m) {
		return memberDao.insertCompanyMember(sqlSession, m);
	}

	@Override
	public int updatePhone(Member m) {
		return memberDao.updatePhone(sqlSession, m);
	}

	@Override
	public Member takeUserInfo(Member m) {
		return memberDao.takeUserInfo(sqlSession, m);
	}

	@Override
	public int updateNick(Member m) {
		return memberDao.updateNick(sqlSession,m);
	}

	@Override
	public int updateAddress(Member m) {
		return memberDao.updateAddress(sqlSession, m);
	}

	@Override
	public int profileImgAreaChange(Member m) {
		return memberDao.profileImgAreaChange(sqlSession, m);
	}

	@Override
	public Member checkMember(String memId) {
		return memberDao.checkMember(sqlSession, memId);
	}
	
	
}
