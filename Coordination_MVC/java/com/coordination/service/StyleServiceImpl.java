package com.coordination.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coordination.dao.StyleDAO;
import com.coordination.dto.StyleVO;
import com.coordination.main.AdminPagination;

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
	public List<StyleVO> StyleList(AdminPagination pagination) throws Exception {
		
		return dao.StyleList(pagination);
	}
	
	//관리자-이미지 갯수
	@Override
	public int StyleListCount() throws Exception {
		
		return dao.StyleListCount();
	}
	
	//검증되지 않은 이미지 불러오기
	@Override
	public List<StyleVO> StyleListIdentify(AdminPagination pagination) throws Exception {
		
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
	
	//사용자가 나만의 옷장에서 옷 클릭 시, 해당 옷을 입은 코디룩 추천
	@Override
	public List<StyleVO> StyleRecommendation(StyleVO vo) throws Exception {
		
		return dao.StyleRecommendation(vo);
	}
	
	//사용자가 나만의 옷장에서 옷 클릭 시, 해당 옷을 입은 코디룩 추천 이미지 갯수
	@Override
	public int StyleRecommendationCount(StyleVO vo) throws Exception {
		
		return dao.StyleRecommendationCount(vo);
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
