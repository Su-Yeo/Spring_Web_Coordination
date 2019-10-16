package com.coordination.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coordination.dto.StyleVO;

@Repository
public class StyleDAOImpl implements StyleDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(StyleDAOImpl.class);
	private static final String Namespace = "com.coordination.mapper.styleMapper";
	
	//이미지 불러오기
	@Override
	public List<StyleVO> StyleList(HashMap<String, String[]> data) throws Exception {
		
		return sqlSession.selectList(Namespace+".StyleList", data);
	}
	
	//Method Override
	@Override
	public List<StyleVO> StyleList() throws Exception {
		
		return sqlSession.selectList(Namespace+".StyleList");
	}
	
	//검증되지 않은 이미지 불러오기
	@Override
	public List<StyleVO> StyleListIdentify() throws Exception {
		
		return sqlSession.selectList(Namespace+".StyleListIdentify");
	}
	
	//업데이트를 위한 이미지 정보 불러오기
	public List<StyleVO> StyleOne(StyleVO vo) throws Exception {

		//Test
		//vo.setNum(1);
		return sqlSession.selectList(Namespace+".StyleOne", vo);
	}

	//이미지 업데이트
	@Override
	public void updateStyle(StyleVO vo) {
		
		sqlSession.update(Namespace+".updateStyle", vo);
		logger.info("=====Data Update Complete!!!=====");
	}
	
	//이미지 검증 업데이트
	@Override
	public void updateIndentify(StyleVO vo) {
		
		sqlSession.update(Namespace+".updateIndentify", vo);
		logger.info("=====Data IdentifyUpdate Complete!!!=====");
	}
		
	//이미지 삭제
	@Override
	public void deleteStyle(StyleVO vo) {
		
		sqlSession.update(Namespace+".deleteStyle", vo);
		logger.info("=====Data Delete Complete!!!=====");
	}

}
