package com.coordination.dao;

import java.util.HashMap;
import java.util.List;

import com.coordination.dto.StyleVO;

public interface StyleDAO {

	//이미지 불러오기
	public List<StyleVO> StyleList(HashMap<String, String[]> data) throws Exception;
	
	//Method Override
	public List<StyleVO> StyleList() throws Exception;
	
	//업데이트를 위한 이미지 정보 불러오기
	public List<StyleVO> StyleOne(StyleVO vo) throws Exception;
	
	//이미지 업데이트
	public void updateStyle(StyleVO vo);
	
	//이미지 삭제
	public void deleteStyle(StyleVO vo);
}
