package com.coordination.service;

import java.util.List;

import com.coordination.dto.StyleVO;

public interface StyleService {

	//이미지 불러오기
	public List<StyleVO> selectStyle(StyleVO vo) throws Exception;
	
	//이미지 저장(관리자)
	public void insertStyle(StyleVO vo);
}
