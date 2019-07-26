package com.coordination.dao;

import java.util.List;

import com.coordination.dto.StyleVO;

public interface StyleDAO {

	//이미지 불러오기
	public List<StyleVO> selectStyle(StyleVO vo) throws Exception;
	
	//이미지 등록(관리자)
	public void insertStyle(StyleVO vo);
}
