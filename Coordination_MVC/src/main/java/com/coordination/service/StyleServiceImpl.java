package com.coordination.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.coordination.dao.StyleDAO;
import com.coordination.dto.StyleVO;

@Service
public class StyleServiceImpl implements StyleService {

	@Inject
	private StyleDAO dao;
	
	//이미지 불러오기
	@Override
	public List<StyleVO> selectStyle(HashMap<String, String[]> data) throws Exception {
		
		return dao.selectStyle(data);
	}

	//이미지 저장(관리자)
	@Override
	public void insertStyle(StyleVO vo) {
		
		dao.insertStyle(vo);
	}

}
