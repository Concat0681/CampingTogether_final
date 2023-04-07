package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingReviewFileVO {
	private int campingReviewPhotoNo;
	private int campingReviewNo;
	private String filepath;
	
}
