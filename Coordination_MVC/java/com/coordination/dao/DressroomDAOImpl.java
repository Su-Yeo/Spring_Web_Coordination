package com.coordination.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coordination.dto.AdminPagination;
import com.coordination.dto.DressroomVO;

@Repository
public class DressroomDAOImpl implements DressroomDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.coordination.mapper.dressroomMapper";
	
	//코디사진 페이징
	public int dressroomListCount(DressroomVO vo) {
		
		return sqlSession.selectOne(Namespace+".dressroomListCount", vo);
	}
	
	//한 회원마다 보여질 저장된 코디사진 출력
	@Override
	public List<DressroomVO> dressroomList(DressroomVO vo) throws Exception {
		
		return sqlSession.selectList(Namespace+".dressroomList", vo);
	}
	
	//회원이 똑같은 사진을 저장할 경우를 처리
	@Override
	public int selectImg(DressroomVO vo) {
		
		return sqlSession.selectOne(Namespace+".selectImg", vo);
	}

	//한 회원이 마음에 드는 코디사진을 저장
	@Override
	public void insertDressroom(DressroomVO vo) {
		
		sqlSession.insert(Namespace+".insertDressroom", vo);
	}

	//한 회원이 저장된 코디 사진을 삭제
	@Override
	public void deleteDressroom(DressroomVO vo) {
		
		sqlSession.delete(Namespace+".deleteDressroom", vo);
	}

}
