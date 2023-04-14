package kr.or.iei.camping.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingReviewData {
	private ArrayList<CampingReview> reviewList;
	private ArrayList<CampingReview> reviewCommentList;
	private ArrayList<CampingReviewFileVO> fileList;
}
