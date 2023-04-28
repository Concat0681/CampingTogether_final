package kr.or.iei.member.model.vo;

import java.util.ArrayList;

import kr.or.iei.shop.model.vo.ShopPhoto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class AdminShopList {
	private String shopTitle;
	private int shopPrice;
	private int count;
	private int score;
	private ArrayList<ShopPhoto> shopPhotoList;
	
}
