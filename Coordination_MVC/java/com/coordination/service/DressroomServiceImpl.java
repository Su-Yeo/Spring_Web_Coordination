package com.coordination.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coordination.dao.DressroomDAO;
import com.coordination.dto.AdminPagination;
import com.coordination.dto.DressroomVO;

@Service
public class DressroomServiceImpl implements DressroomService {

	@Autowired
	private DressroomDAO dao;
	
	//코디사진 페이징
	public int dressroomListCount(DressroomVO vo) {
		
		return dao.dressroomListCount(vo);
	}
	
	//한 회원마다 보여질 저장된 코디사진 출력
	@Override
	public List<DressroomVO> dressroomList(DressroomVO vo) throws Exception {
		
		return dao.dressroomList(vo);
	}
	
	//회원이 똑같은 사진을 저장할 경우를 처리
	@Override
	public int selectImg(DressroomVO vo) {
			
		return	dao.selectImg(vo);
	}	

	//한 회원이 마음에 드는 코디사진을 저장
	@Override
	public void insertDressroom(DressroomVO vo) {
		
		dao.insertDressroom(vo);
	}

	//한 회원이 저장된 코디 사진을 삭제
	@Override
	public void deleteDressroom(DressroomVO vo) {
		
		dao.deleteDressroom(vo);
	}

}
