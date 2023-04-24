package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingBookmark {

	private int campingBookmarkNo;
	private int campingNo;
	private String memberId;
}
