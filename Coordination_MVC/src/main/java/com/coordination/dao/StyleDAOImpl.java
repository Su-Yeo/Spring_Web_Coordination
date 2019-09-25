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

		//AJAX에서 받아온 값을 Algorithm 변수에 대입하여
		//온도별로 해당 값에 맞는 옷의 종류를 set메소드에 추가하면 될 것 같음.
		//나름 편법이라 다른 방법이 있는지 계속 알아봐야할 것 같음.
		//vo.setData("harf-tshirt");
		//vo.setColor("harf-shirt");
		//vo.setShopcode("t-shirt");
		//vo.setUrl("shirt");
		
		return sqlSession.selectList(Namespace+".StyleList", data);
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
		
	//이미지 삭제
	@Override
	public void deleteStyle(StyleVO vo) {
		
		sqlSession.update(Namespace+".deleteStyle", vo);
		logger.info("=====Data Delete Complete!!!=====");
	}

}
