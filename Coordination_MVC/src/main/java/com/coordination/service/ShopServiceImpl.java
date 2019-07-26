package com.coordination.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.coordination.dao.ShopDAO;
import com.coordination.dto.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;
	
	@Override
	public List<ShopVO> selectShop() throws Exception {
		
		return dao.selectShop();
	}

	@Override
	public void insertShop(ShopVO vo) {
		
		dao.insertShop(vo);
	}

	@Override
	public void updateShop(ShopVO vo) {
		
		dao.updateShop(vo);
	}

	@Override
	public void deleteShop(ShopVO vo) {
		
		dao.deleteShop(vo);
	}

}
