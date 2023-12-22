package com.kh.bigFish.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.chat.model.vo.Chat;
import com.kh.bigFish.member.model.vo.Member;

@Repository
public class MemberDao {
	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	// 이메일 중복확인
	public int checkEmailId(SqlSessionTemplate sqlSession, String emailId) {
		return sqlSession.selectOne("memberMapper.checkEmailId", emailId);
	}
	// 회원가입
	public int insertPersonalMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertPersonalMember", m);
	}
	// 닉네임 중복확인
	public int checkNick(SqlSessionTemplate sqlSession, String memNick) {
		return sqlSession.selectOne("memberMapper.checkNick",memNick);
	}
	
	public int insertCompanyMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertCompanyMember", m);
	}
	
	public int updatePhone(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePhone", m);
	}
	
	public Member takeUserInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.takeUserInfo", m);
	}
	
	public int updateNick(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateNick", m);
	}
	
	public int updateAddress(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateAddress", m);
	}
	
	public int profileImgAreaChange(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.profileImgAreaChange", m);
	}
	
	public Member checkMember(SqlSessionTemplate sqlSession,String memId) {
		return sqlSession.selectOne("memberMapper.checkMember",memId);
	}
	
	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId",m);
	}
	
	public Member findPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findPwd",m);
	}
	
	public Member getMemberInfoForChat(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.selectOne("memberMapper.getMemberInfoForChat",c);
	}
	
	public Member getUserNameInfoForChat(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.getUserNameInfoForChat", m);
	}
	
	public Member loginMemberId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMemberId", m);
	}
	
	public int insertNaverMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertNaverMember", m);
	}
	
	public int updateTmpPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateTmpPwd", m);
	}
	
	public int updateMyPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMyPwd", m);
	}
	
	public int nickIsSame(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.nickIsSame", m);
	}
}
