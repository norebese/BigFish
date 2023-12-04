package com.kh.bigFish.store.model.dao;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.bigFish.store.model.vo.Store;

@Repository
public class StoreDao {

	public ArrayList<Store> ajaxStoreList(SqlSessionTemplate sqlSession, Store s) {
		
		return (ArrayList)sqlSession.selectList("storeMapper.ajaxStoreList", s);
	}

	public Store resDetailPage(SqlSessionTemplate sqlSession, int num) {
		
		return sqlSession.selectOne("storeMapper.resDetailPage", num);
	}

	public int checkBusinessNo(SqlSessionTemplate sqlSession, String businessNo) {
		return sqlSession.selectOne("storeMapper.checkBusinessNo",businessNo);
	}
}
