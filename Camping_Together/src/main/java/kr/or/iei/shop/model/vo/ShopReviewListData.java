package kr.or.iei.shop.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShopReviewListData {

	ArrayList<ShopReview> shopReviewList;
	private String reviewPageNavi;
}
