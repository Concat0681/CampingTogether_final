package kr.or.iei.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyReview {
	private String campingTitle;
	private String filepath;
	private String campingReviewContent;
	private String campingReviewDate;
}
