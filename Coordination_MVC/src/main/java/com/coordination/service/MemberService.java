package com.coordination.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.coordination.dto.MemberVO;

public interface MemberService {

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
	public MemberVO loginCheck(MemberVO vo, HttpSession session, HttpServletRequest request) throws Exception;

}
