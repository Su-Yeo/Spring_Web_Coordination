package com.coordination.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coordination.dao.ClosetDAO;
import com.coordination.dto.ClosetVO;

@Service
public class ClosetServiceImpl implements ClosetService {

	@Autowired
	private ClosetDAO dao;
	
	//각 회원의 옷장 출력
	@Override
	public List<ClosetVO> closetList(ClosetVO vo) throws Exception {
		
		return dao.closetList(vo);
	}

	//회원이 나만의 옷장에 사진 저장
	@Override
	public void insertCloset(ClosetVO vo) {
		
		dao.insertCloset(vo);
	}

	//회원의 나만의 옷장 정보 수정
	@Override
	public void updateCloset(ClosetVO vo) {
		
		dao.updateCloset(vo);
	}

	//회원의 나만의 옷장에서 선택한 사진 삭제
	@Override
	public void deleteCloset(ClosetVO vo) {
		
		dao.deleteCloset(vo);
	}

}
