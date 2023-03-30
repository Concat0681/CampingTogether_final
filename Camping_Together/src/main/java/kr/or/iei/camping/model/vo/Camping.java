package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Camping {
	
	private int campingNo;
	private String memberId;
	private String campingTitle;
	private String campingContent;
	private String campingType;
	private String campingAddr;
	private String campingAddrDetail;
	private String campingPhone;
}