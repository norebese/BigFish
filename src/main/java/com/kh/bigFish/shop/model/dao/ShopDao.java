package com.kh.bigFish.shop.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.shop.model.vo.Shop;

@Repository
public class ShopDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("shopMapper.selectListCount");
	}
	
	public ArrayList<Shop> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("shopMapper.selectList", null, rowBounds);
	}

	public int insertShopFile(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("shopMapper.insertShopFile", at);
	}

	public int insertShop(SqlSessionTemplate sqlSession, Shop s) {
		return sqlSession.insert("shopMapper.insertShop", s);
	}

	public Shop selectShop(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.selectOne("shopMapper.selectShop", sno);
	}

	public int updateShop(SqlSessionTemplate sqlSession, Shop s) {
		return sqlSession.update("shopMapper.updateShop", s);
	}

	public int updateFileShop(SqlSessionTemplate sqlSession, Shop s) {
		return sqlSession.update("shopMapper.updateFileShop", s);
	}

	public int deleteShop(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.update("shopMapper.deleteShop", sno);
	}
}
