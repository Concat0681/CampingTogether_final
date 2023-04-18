package kr.or.iei.shop.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.shop.model.vo.Shop;
import kr.or.iei.shop.model.vo.ShopBasket;
import kr.or.iei.shop.model.vo.ShopReview;
import kr.or.iei.shop.model.vo.ShopReviewPhoto;

@Repository
public class ShopDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Shop> selectShopList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("shop.selectShopList", map);
		return (ArrayList<Shop>)list;
	}

	public int insertShop(Shop shop) {
		int result = sqlSession.insert("shop.insertShop", shop);
		return result;
	}

	public int insertShopPhoto(HashMap<String, Object> map) {
		int result = sqlSession.insert("shop.insertShopPhoto", map);
		return result;
	}

	public int selectLatestShop() {
		int shopNo = sqlSession.selectOne("shop.selectLatestShop");
		return shopNo;
	}

	public Shop selectOneShop(int shopNo) {
		Shop shop = sqlSession.selectOne("shop.selectOneShop", shopNo);
		return shop;
	}

	public int selectShopCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("shop.selectShopCount", map);
		return totalCount;
	}

	public int insertShopReview(ShopReview sr) {
		int result = sqlSession.insert("shop.insertShopReview", sr);
		return result;
	}

	public int selectLatestShopReview() {
		int shopReviewNo = sqlSession.selectOne("shop.selectLatestShopReview");
		return shopReviewNo;
	}

	public int insertShopReviewPhoto(ShopReviewPhoto srp) {
		int result = sqlSession.insert("shop.insertShopReviewPhoto", srp);
		return result;
	}

	public ArrayList<ShopReview> selectShopReviewList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("shop.selectShopReviewList", map);
		return (ArrayList<ShopReview>)list;
	}

	public int selectShopReviewCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("shop.selectShopReviewCount", map);
		return totalCount;
	}

	public int insertBasket(ShopBasket basket) {
		int result = sqlSession.insert("shop.insertBasket", basket);
		return result;
	}

	public int deleteShopReviewPhoto(ShopReviewPhoto srp) {
		int result = sqlSession.delete("shop.deleteShopReviewPhoto", srp);
		return result;
	}

	public int updateShopReview(ShopReview sr) {
		int result = sqlSession.update("shop.updateShopReview", sr);
		return result;
	}

	public int deleteShopReview(int shopReviewNo) {
		int result = sqlSession.delete("shop.deleteShopReview", shopReviewNo);
		return result;
	}
}
