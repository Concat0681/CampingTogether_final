package kr.or.iei.shop.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.shop.model.dao.ShopDao;
import kr.or.iei.shop.model.vo.Shop;
import kr.or.iei.shop.model.vo.ShopListMainData;

@Service
public class ShopService {

	@Autowired
	private ShopDao dao;

	public ShopListMainData selectShopList(int shopCategory, int reqPage) {
		int numPerPage = 8;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCategory", shopCategory);
		map.put("start", start);
		map.put("end", end);
		ArrayList<Shop> shopList = dao.selectShopList(map);
		int totalCount = dao.selectShopCount(map);
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		String pageNavi = "";
		if(reqPage <= totalPage) {
			pageNavi += "<button class='btn1' onclick='viewShopList("+shopCategory+","+(reqPage)+")'>더보기</button>";
		}
		ShopListMainData slmd = new ShopListMainData();
		slmd.setShopList(shopList);
		slmd.setPageNavi(pageNavi);
		return slmd;
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

	public Shop selectOneShop(int shopNo) {
		Shop shop = dao.selectOneShop(shopNo);
		return shop;
	}
}
