package com.coordination.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coordination.dto.ClosetVO;

@Repository
public class ClosetDAOImpl implements ClosetDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.coordination.mapper.closetMapper";
	
	//각 회원의 옷장 출력
	@Override
	public List<ClosetVO> closetList(ClosetVO vo) throws Exception {
		
		return sqlSession.selectList(Namespace+".closetList", vo);
	}	
	
	//각 회원의 옷장 출력 top
	@Override
	public List<ClosetVO> closetListTop(ClosetVO vo) throws Exception {
		
		return sqlSession.selectList(Namespace+".closetListTop", vo);
	}
	
	//각 회원의 옷장 출력 bottom
		@Override
		public List<ClosetVO> closetListBottom(ClosetVO vo) throws Exception {
			
			return sqlSession.selectList(Namespace+".closetListBottom", vo);
		}

	//회원이 나만의 옷장에 사진 저장
	@Override
	public void insertCloset(ClosetVO vo) {
		
		sqlSession.insert(Namespace+".insertCloset", vo);
	}

	//회원의 나만의 옷장 정보 수정
	@Override
	public void updateCloset(ClosetVO vo) {
		
		sqlSession.update(Namespace+".updateCloset", vo);
	}

	//회원의 나만의 옷장에서 선택한 사진 삭제
	@Override
	public void deleteCloset(ClosetVO vo) {
		
		sqlSession.delete(Namespace+".deleteCloset", vo);
	}

}
