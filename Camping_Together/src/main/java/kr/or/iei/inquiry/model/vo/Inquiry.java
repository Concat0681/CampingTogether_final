package kr.or.iei.inquiry.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Inquiry {
	private int inquiryNo;
	private String inquiryWriter;
	private String inquiryTitle;
	private	String inquiryContent;
	private String regDate;
	private int status;
	private int secret;
	
	private int adminInquiryNo;
	private String adminInquiryAnswer;
	private String adminRegDate;
//	private int readCount;
//	private int groupNo;
//	private int groupOrd;
//	private int depth;
}
