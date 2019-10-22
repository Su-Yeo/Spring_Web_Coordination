package com.coordination.dao;

import java.util.HashMap;
import java.util.List;

import com.coordination.dto.StyleVO;
import com.coordination.main.Pagination;

public interface StyleDAO {

	//이미지 불러오기
	public List<StyleVO> TemperatureStyle(HashMap<String, String[]> data) throws Exception;
	
	//관리자-이미지 불러오기
	public List<StyleVO> StyleList(Pagination pagination) throws Exception;
	
	//관리자-이미지 갯수
	public int StyleListCount() throws Exception;
	
	//검증되지 않은 이미지 불러오기
	public List<StyleVO> StyleListIdentify(Pagination pagination) throws Exception;
	
	//검증되지 않은 이미지 갯수
	public int StyleListIdentifyCount() throws Exception;
	
	//업데이트를 위한 이미지 정보 불러오기
	public List<StyleVO> StyleOne(StyleVO vo) throws Exception;
	
	//이미지 업데이트
	public void updateStyle(StyleVO vo);
	
	//이미지 검증 업데이트
	public void updateIndentify(StyleVO vo);
	
	//이미지 삭제
	public void deleteStyle(StyleVO vo);
}
