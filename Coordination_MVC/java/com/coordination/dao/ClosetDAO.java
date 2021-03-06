package com.coordination.dao;

import java.util.List;

import com.coordination.dto.ClosetVO;

public interface ClosetDAO {

	//각 회원의 옷장 출력
	public List<ClosetVO> closetList(ClosetVO vo) throws Exception;
	
	//각 회원의 옷장 출력 top
	public List<ClosetVO> closetListTop(ClosetVO vo) throws Exception;
	
	//각 회원의 옷장 출력 bottom
	public List<ClosetVO> closetListBottom(ClosetVO vo) throws Exception;
	
	//회원이 나만의 옷장에 사진 저장
	public void insertCloset(ClosetVO vo);
	
	//회원의 나만의 옷장 정보 수정
	public void updateCloset(ClosetVO vo);
	
	//회원의 나만의 옷장에서 선택한 사진 삭제
	public void deleteCloset(ClosetVO vo);	
}
