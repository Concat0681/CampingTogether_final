package kr.or.iei.camping.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingReview {
	private int campingReviewNo;
	private int campingNo;
	private String memberId;
	private String campingReviewTitle;
	private String campingReviewContent;
	private int campingReviewRating;
	private int campingReviewRef;
	private String memberPhoto;
	private ArrayList<CampingReviewFileVO> fileList;
}
