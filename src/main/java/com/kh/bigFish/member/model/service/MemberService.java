package com.kh.bigFish.member.model.service;

import com.kh.bigFish.chat.model.vo.Chat;
import com.kh.bigFish.member.model.vo.Member;

public interface MemberService {
	
	// 로그인
	Member loginMember(Member m);
	
	// 로그인(아이디로만)
	Member loginMemberId(Member m);
	
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
	
	// 프로필 이미지 변경
	int profileImgAreaChange(Member m);
	
	// 네이버 로그인 체크
	Member checkMember(String memId);
	
	// 아이디 찾기
	Member findId(Member m);
	
	// 비밀번호 찾기
	Member findPwd(Member m);
	
	// 멤버 정보 가져오기 (채팅)
	Member getMemberInfoForChat(Chat c);
	
	// 멤버 이름 가져오기 (채팅)
	Member getUserNameInfoForChat(Member m);
	
	// 개인(네이버) 회원 가입
	int insertNaverMember(Member m);
	
	// 비밀번호 찾기 후 임시비밀번호로 변경
	int updateTmpPwd(Member m);
	
	// 비밀번호 변경
	int updateMyPwd(Member m);
	
	// 닉네임 변경 시 중복 체크
	int nickIsSame(Member m);
	
}
