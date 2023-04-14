package kr.or.iei.shop.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.shop.model.dao.ShopDao;
import kr.or.iei.shop.model.vo.Shop;

@Service
public class ShopService {

	@Autowired
	private ShopDao dao;

	public ArrayList<Shop> selectShopList(int campingCategory, int start, int end) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCategory", campingCategory);
		map.put("start", start);
		map.put("end", end);
		ArrayList<Shop> list = dao.selectShopList(map);
		return list;
	}
	
	public int insertShop(Shop shop) {
		int result = dao.insertShop(shop);
		return result;
	}

	public int insertShopPhoto(String filepath, int shopNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("filepath", filepath);
		map.put("shopNo", shopNo);
		int result = dao.insertShopPhoto(map);
		return result;
	}

	public int selectLatestShop() {
		int shopNo = dao.selectLatestShop();
		return shopNo;
	}
}
