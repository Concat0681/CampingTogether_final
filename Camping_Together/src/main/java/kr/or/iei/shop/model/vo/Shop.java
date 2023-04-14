package kr.or.iei.shop.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Shop {
	
	private int shopNo;
	private String memberId;
	private int shopCategory;
	private String shopTitle;
	private int shopPrice;
	private int delivaryPrice;
	private String shopContent;
	private int maxCount;
	private int score;
	private int sellCount;
	private ArrayList<ShopPhoto> shopPhotoList;
}
