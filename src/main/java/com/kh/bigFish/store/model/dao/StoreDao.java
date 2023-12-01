package com.kh.bigFish.store.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDao {
	
	
	public int checkBusinessNo(SqlSessionTemplate sqlSession, String businessNo) {
		return sqlSession.selectOne("storeMapper.checkBusinessNo",businessNo);
	}
}
