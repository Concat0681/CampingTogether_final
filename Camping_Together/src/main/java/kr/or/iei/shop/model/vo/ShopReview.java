package kr.or.iei.shop.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShopReview {
	
	private int shopReviewNo;
	private String memberId;
	private int shopNo;
	private String ShopReviewContent;
	private int shopReviewRating;
	private int shopReviewRef;
	private ArrayList<ShopReviewPhoto> reviewPhotoList;
}
