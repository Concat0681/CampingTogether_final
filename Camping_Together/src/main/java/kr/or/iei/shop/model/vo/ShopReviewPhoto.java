package kr.or.iei.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShopReviewPhoto {

	private int shopReviewPhotoNo;
	private int shopReviewNo;
	private String filepath;
}
