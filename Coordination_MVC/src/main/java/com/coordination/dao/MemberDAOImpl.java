package com.coordination.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.coordination.dto.MemberVO;

@Service
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.coordination.mapper.memberMapper";
	
	//회원목록 전체 조회
//	@Override
//	public List<MemberVO> memberList() throws Exception {
//		
//		return sqlSession.selectList(Namespace+".memberList");
//	}
//
//	//특정 회원 정보 조회
//	@Override
//	public List<MemberVO> selectMember(MemberVO vo) throws Exception {
//		
//		return sqlSession.selectList(Namespace+".selectMember", vo);
//	}

	//회원가입
	@Override
	public void insertMember(MemberVO vo) {
		
		sqlSession.insert(Namespace+".insertMember", vo);
		System.out.println("*****Member Data Insert Completion*****");
	}

	//회원정보 수정
	@Override
	public void updateMember(MemberVO vo) {
		
		sqlSession.update(Namespace+".updateMember", vo);
		System.out.println("*****Member Data Update Completion*****");
	}

	//회원정보 삭제
	//member + closet Foreign Key로 인해 삭제가 불가능하므로
	//삭제를 원하는 회원의 비밀번호를 랜덤으로 암호화하여 접속이 불가능하게끔 변경
	@Override
	public void deleteMember(MemberVO vo) {
		
		sqlSession.update(Namespace+".deleteMember", vo);
		System.out.println("*****Member Data Delete Completion*****");
	}

	//로그인 처리
	@Override
	public MemberVO loginCheck(MemberVO vo) throws Exception {
		
		vo = sqlSession.selectOne(Namespace+".login", vo);
		
		return vo;
	}
	
	//회원가입 시, ID 중복체크
	@Override
	public MemberVO signUpCheck(MemberVO vo) throws Exception{
		
		return sqlSession.selectOne(Namespace+".signUpCheck", vo);
	}

}
