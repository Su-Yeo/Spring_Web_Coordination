package com.coordination.dao;

import java.util.List;

import com.coordination.dto.ShopVO;

public interface ShopDAO {

	public List<ShopVO> selectShop() throws Exception;
	
	public void insertShop(ShopVO vo);
	public void updateShop(ShopVO vo);
	public void deleteShop(ShopVO vo);
}
