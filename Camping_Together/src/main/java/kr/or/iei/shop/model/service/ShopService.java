package kr.or.iei.shop.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.shop.model.dao.ShopDao;
import kr.or.iei.shop.model.vo.Shop;
import kr.or.iei.shop.model.vo.ShopBasket;
import kr.or.iei.shop.model.vo.ShopListMainData;
import kr.or.iei.shop.model.vo.ShopOrder;
import kr.or.iei.shop.model.vo.ShopPayment;
import kr.or.iei.shop.model.vo.ShopPhoto;
import kr.or.iei.shop.model.vo.ShopReview;
import kr.or.iei.shop.model.vo.ShopReviewListData;
import kr.or.iei.shop.model.vo.ShopReviewPhoto;

@Service
public class ShopService {

	@Autowired
	private ShopDao dao;

	public ShopListMainData selectShopList(int shopCategory, int reqPage, String order, int numPerPage) {
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCategory", shopCategory);
		map.put("start", start);
		map.put("end", end);
		map.put("order", order);
		ArrayList<Shop> shopList = dao.selectShopList(map);
		int totalCount = dao.selectShopCount(map);
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 5;
		int pageNo = 1;
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item'onclick='shopListOrder(this,"+shopCategory+","+(pageNo-1)+",\""+order+"\")'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li><a class='page-item' onclick='shopListOrder(this,"+shopCategory+","+pageNo+",\""+order+"\")'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li><a class='page-item' onclick='shopListOrder(this,"+shopCategory+","+pageNo+",\""+order+"\")'><span class='material-symbols-outlined'>chevron_right</span></a></li>";
		}
		ShopListMainData slmd = new ShopListMainData();
		slmd.setShopList(shopList);
		slmd.setPageNavi(pageNavi);
		slmd.setTotalCount(totalCount);
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

	public Shop selectOneShop(int shopNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("shopNo", shopNo);
		Shop shop = dao.selectOneShop(map);
		return shop;
	}

	public int insertShopReview(ShopReview sr) {
		int result = dao.insertShopReview(sr);
		return result;
	}

	public int selectLatestShopReview() {
		int shopReviewNo = dao.selectLatestShopReview();
		return shopReviewNo;
	}

	public int insertShopReviewPhoto(ShopReviewPhoto srp) {
		int result = dao.insertShopReviewPhoto(srp);
		return result;
	}

	public ShopReviewListData selectShopReviewList(int shopNo, int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("shopNo", shopNo);
		ArrayList<ShopReview> shopReviewList = dao.selectShopReviewList(map);
		int totalCount = dao.selectShopReviewCount(map);
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 5;
		int pageNo = 1;
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item'onclick='sendNavi("+shopNo+","+(pageNo-1)+")'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li><a class='page-item' onclick='sendNavi("+shopNo+","+pageNo+")'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li><a class='page-item' onclick='sendNavi("+shopNo+","+(pageNo)+")'><span class='material-symbols-outlined'>chevron_right</span></a></li>";
		}
		ShopReviewListData srld = new ShopReviewListData();
		srld.setShopReviewList(shopReviewList);
		srld.setReviewPageNavi(pageNavi);
		return srld;
	}

	public int insertBasket(ShopBasket basket) {
		int result = dao.insertBasket(basket);
		return result;
	}

	public int deleteShopReviewPhoto(ShopReviewPhoto srp) {
		int result = dao.deleteShopReviewPhoto(srp);
		return result;
	}
	
	public int updateShopReview(ShopReview sr) {
		int result = dao.updateShopReview(sr);
		return result;
	}

	public int deleteShopReview(int shopReviewNo) {
		int result = dao.deleteShopReview(shopReviewNo);
		return result;
	}

	public int insertShopOrder(ShopOrder so, ShopPayment spm, int shopNo, int maxCount) {
		int result = dao.insertShopOrder(so);
		if(result > 0) {
			spm.setOrderNo(so.getOrderNo());
			result = dao.insertShopPayment(spm);
			if(result > 0) {
				result = dao.deleteOrderWishList(shopNo);
				if(result > 0) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("shopNo", shopNo);
					map.put("maxCount", maxCount);
					result = dao.updateShopMaxCount(map);
				}
			}
		}
		return result;
	}

	public ShopBasket selectMyBasket(ShopBasket basket) {
		ShopBasket b = dao.selectMyBasket(basket);
		return b;
	}

	public ShopOrder selectMyOrder(String memberId, int shopNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("shopNo", shopNo);
		ShopOrder so = dao.selectMyOrder(map);
		return so;
	}

	public int updateShop(Shop shop) {
		int result = dao.updateShop(shop);
		return result;
	}

	public int deleteShopPhoto(ShopPhoto sp) {
		int result = dao.deleteShopPhoto(sp);
		return result;
	}

	public int deleteShop(int shopNo) {
		int result = dao.deleteShop(shopNo);
		return result;
	}

	public ArrayList<ShopReviewPhoto> selectOneShopReviewPhoto(int shopReviewNo) {
		ArrayList<ShopReviewPhoto> photoList = dao.selectOneShopReviewPhoto(shopReviewNo);
		return photoList;
	}
}
