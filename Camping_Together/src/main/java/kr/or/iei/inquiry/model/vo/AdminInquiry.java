package kr.or.iei.inquiry.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminInquiry {
	private int adminInquiryNo;
	private int inquiryNo;
	private String adminInquiryAnswer;
	private String regDate;
}
