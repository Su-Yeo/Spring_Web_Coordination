package com.coordination.service;

import java.util.HashMap;
import java.util.List;

import com.coordination.dto.AdminPagination;
import com.coordination.dto.StyleVO;

public interface StyleService {

	//이미지 불러오기
	public List<StyleVO> TemperatureStyle(HashMap<String, String[]> data) throws Exception;
		
	//관리자-이미지 불러오기
	public List<StyleVO> StyleList(AdminPagination pagination) throws Exception;
		
	//관리자-이미지 갯수
	public int StyleListCount() throws Exception;
	
	//검증되지 않은 이미지 불러오기
	public List<StyleVO> StyleListIdentify(AdminPagination pagination) throws Exception;
	
	//검증되지 않은 이미지 갯수
	public int StyleListIdentifyCount() throws Exception;
	
	//업데이트를 위한 이미지 정보 불러오기
	public List<StyleVO> StyleOne(StyleVO vo, int num) throws Exception;
	
	//사용자가 나만의 옷장에서 옷 클릭 시, 해당 옷을 입은 코디룩 추천
	public List<StyleVO> StyleRecommendation(StyleVO vo) throws Exception;
	
	//사용자가 나만의 옷장에서 옷 클릭 시, 해당 옷을 입은 코디룩 추천 이미지 갯수
	public int StyleRecommendationCount(StyleVO vo) throws Exception;
	
	//이미지 업데이트
	public void updateStyle(StyleVO vo);
	
	//이미지 검증 업데이트
	public void updateIndentify(StyleVO vo);
		
	//이미지 삭제
	public void deleteStyle(StyleVO vo);
}
