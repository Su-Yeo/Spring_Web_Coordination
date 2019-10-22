package com.coordination.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coordination.dao.StyleDAO;
import com.coordination.dto.StyleVO;
import com.coordination.main.Pagination;

@Service
public class StyleServiceImpl implements StyleService {

	@Autowired
	private StyleDAO dao;
	
	//이미지 불러오기
	@Override
	public List<StyleVO> TemperatureStyle(HashMap<String, String[]> data) throws Exception {
		
		return dao.TemperatureStyle(data);
	}
	
	//관리자-이미지 불러오기
	@Override
	public List<StyleVO> StyleList(Pagination pagination) throws Exception {
		
		return dao.StyleList(pagination);
	}
	
	//관리자-이미지 갯수
	@Override
	public int StyleListCount() throws Exception {
		
		return dao.StyleListCount();
	}
	
	//검증되지 않은 이미지 불러오기
	@Override
	public List<StyleVO> StyleListIdentify(Pagination pagination) throws Exception {
		
		return dao.StyleListIdentify(pagination);
	}
	
	//검증되지 않은 이미지 갯수
	@Override
	public int StyleListIdentifyCount() throws Exception {
		
		return dao.StyleListIdentifyCount();
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
	
	//이미지 검증 업데이트
	@Override
	public void updateIndentify(StyleVO vo) {
		
		dao.updateIndentify(vo);
	}
			
	//이미지 삭제
	@Override
	public void deleteStyle(StyleVO vo) {
			
		dao.deleteStyle(vo);
	}

}
