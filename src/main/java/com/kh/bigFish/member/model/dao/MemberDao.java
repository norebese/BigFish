package com.kh.bigFish.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m);
		System.out.println(sqlSession.selectOne("memberMapper.loginMember", m));
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	
	
	
}
