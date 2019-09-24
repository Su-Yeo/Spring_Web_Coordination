package com.coordination.dao;

import java.util.List;

import com.coordination.dto.MemberVO;

public interface MemberDAO {

	//회원목록 전체 조회
	//public List<MemberVO> memberList() throws Exception;
	
	//특정 회원 정보 조회
	//public List<MemberVO> selectMember(MemberVO vo) throws Exception;
	
	//회원가입
	public void insertMember(MemberVO vo);
	
	//회원정보 수정
	public void updateMember(MemberVO vo);
	
	//회원정보 삭제
	public void deleteMember(MemberVO vo);
	
	//로그인 처리
	public MemberVO loginCheck(MemberVO vo) throws Exception;
	
	//회원가입 시, ID 중복체크
	public MemberVO signUpCheck(MemberVO vo) throws Exception;
}
