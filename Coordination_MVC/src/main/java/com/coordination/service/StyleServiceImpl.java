package com.coordination.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coordination.dao.StyleDAO;
import com.coordination.dto.StyleVO;

@Service
public class StyleServiceImpl implements StyleService {

	@Autowired
	private StyleDAO dao;
	
	//이미지 불러오기
	@Override
	public List<StyleVO> StyleList(HashMap<String, String[]> data) throws Exception {
		
		return dao.StyleList(data);
	}
	
	//업데이트를 위한 이미지 정보 불러오기
	@Override	
	public List<StyleVO> StyleOne(StyleVO vo, int num) throws Exception {
		
		vo.setNum(num);
		return dao.StyleOne(vo);
	}

	//이미지 업데이트
	@Override
	public void updateStyle(StyleVO vo) {
			
		dao.updateStyle(vo);
	}
			
	//이미지 삭제
	@Override
	public void deleteStyle(StyleVO vo) {
			
		dao.deleteStyle(vo);
	}

}
