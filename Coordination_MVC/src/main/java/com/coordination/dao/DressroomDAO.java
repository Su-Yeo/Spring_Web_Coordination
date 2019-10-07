package com.coordination.dao;

import java.util.List;

import com.coordination.dto.DressroomVO;

public interface DressroomDAO {

	//한 회원마다 보여질 저장된 코디사진 출력
	public List<DressroomVO> dressroomList(DressroomVO vo) throws Exception;
	
	//한 회원이 마음에 드는 코디사진을 저장
	public void insertDressroom(DressroomVO vo);
	
	//한 회원이 저장된 코디 사진을 삭제
	public void deleteDressroom(DressroomVO vo);
}
