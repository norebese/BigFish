package com.kh.bigFish.member.model.service;

import com.kh.bigFish.member.model.vo.Member;

public interface MemberService {
	
	// 로그인
	Member loginMember(Member m);
	
	// 회원가입시 이메일 중복체크
	int checkEmailId(String emailId);
	
	// 회원가입시 닉네임 중복체크
	int checkNick(String memNick);
	
	// 개인 회원 가입
	int insertPersonalMember(Member m);
	
	// 사업자 회원 가입
	int insertCompanyMember(Member m);
	
	// 핸드폰 변경
	int updatePhone(Member m);
	
	// 정보 변경 이후 로그인 정보 가져오기
	Member takeUserInfo(Member m);
	
	// 닉네임 변경
	int updateNick(Member m);
	
	// 주소 변경
	int updateAddress(Member m);
	
}
