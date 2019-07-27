package com.coordination.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coordination.dto.StyleVO;

@Repository
public class StyleDAOImpl implements StyleDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.coordination.mapper.styleMapper";
	
	//이미지 불러오기
	@Override
	public List<StyleVO> selectStyle(HashMap<String, String[]> data) throws Exception {

		//AJAX에서 받아온 값을 Algorithm 변수에 대입하여
		//온도별로 해당 값에 맞는 옷의 종류를 set메소드에 추가하면 될 것 같음.
		//나름 편법이라 다른 방법이 있는지 계속 알아봐야할 것 같음.
		//vo.setData("harf-tshirt");
		//vo.setColor("harf-shirt");
		//vo.setShopcode("t-shirt");
		//vo.setUrl("shirt");
		
		return sqlSession.selectList(Namespace+".selectStyle", data);
	}

	//이미지 등록(관리자)
	@Override
	public void insertStyle(StyleVO vo) {
		
		sqlSession.insert(Namespace+".insertStyle", vo);
		System.out.println("---Data Insert Completion---");
	}

}
