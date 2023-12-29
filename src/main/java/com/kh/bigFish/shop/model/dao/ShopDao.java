package com.kh.bigFish.shop.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.shop.model.vo.KakaoRequestDto;
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
	
//	public int insertParameter(SqlSessionTemplate sqlSession,String parameter) {
//		  Map<String, String> paramMap = getParameterMap(parameter);
//		System.out.println("샾서비스"+parameter);
//		return 3;//sqlSession.insert("shopMapper.insertParameter",parameter);
//	}

	public int insertParameter(SqlSessionTemplate sqlSession, String parameter) {
	    System.out.println("샾서비스" + parameter);

	    // URL 쿼리 문자열을 맵으로 변환
	    Map<String, String> paramMap = getParameterMap(parameter);
System.out.println("99834234"+paramMap);
	    
	  

	    return sqlSession.insert("kakaoRequestDtoMapper.insertParameter",paramMap);
	}

	// URL 쿼리 문자열을 맵으로 변환하는 함수
	private Map<String, String> getParameterMap(String queryString) {
	    Map<String, String> paramMap = new HashMap<>();
	    String[] params = queryString.split("&");
	    for (String param : params) {
	        String[] keyValue = param.split("=");
	        if (keyValue.length == 2) {
	            String key = keyValue[0];
	            String value = keyValue[1];
	            paramMap.put(key, value);
	        }
	    }
	    return paramMap;
	}

	public int updatePg_token(SqlSessionTemplate sqlSession, String j) {
		  Map<String, String> paramMap = gettokenMap(j);
		  System.out.println("헷akstp"+paramMap);
		return sqlSession.update("kakaoRequestDtoMapper.updatePg_token", paramMap);
	}
	public Map<String, String> gettokenMap(String input) {
        Map<String, String> resultMap = new HashMap<>();
        String[] parts = input.split(",");

        // 앞뒤 공백 제거
        String firstPart = parts.length > 0 ? parts[0].trim() : null;

        // 두 번째 부분이 "null" 문자열인 경우에는 null로 설정
        String secondPart = parts.length > 1 && !"null".equalsIgnoreCase(parts[1].trim()) ? parts[1].trim() : null;

        resultMap.put("pg_token", firstPart);
        resultMap.put("productNo", secondPart);

        return resultMap;
    }

	
	public ArrayList<KakaoRequestDto> selectKakaoRequestDtoList(SqlSessionTemplate sqlSession, String MemId){
	
		ArrayList<KakaoRequestDto> list = (ArrayList)sqlSession.selectList("kakaoRequestDtoMapper.selectKakaoRequestDtoList", MemId);
	
		
		return list;
	}


	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("shopMapper.selectSearchListCount", map);
	}

	public ArrayList<Shop> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("shopMapper.selectSearchList", map, rowBounds);
	}

	public Shop buyShop(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.selectOne("shopMapper.buyShop", sno);
	}


}
