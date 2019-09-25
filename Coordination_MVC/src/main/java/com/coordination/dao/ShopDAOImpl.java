package com.coordination.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coordination.dto.ShopVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.coordination.mapper.shopMapper";
	
	@Override
	public List<ShopVO> selectShop() throws Exception {
		
		return sqlSession.selectList(Namespace+".selectShop");
	}

	@Override
	public void insertShop(ShopVO vo) {
		
		sqlSession.insert(Namespace+".insertShop", vo);
		System.out.println("---Data Insert Completion---");
	}

	@Override
	public void updateShop(ShopVO vo) {

		sqlSession.insert(Namespace+".updateShop", vo);
		System.out.println("---Data Update Completion---");
	}

	@Override
	public void deleteShop(ShopVO vo) {
		
		sqlSession.insert(Namespace+".deleteShop", vo);
		System.out.println("---Data Delete Completion---");
	}

}
