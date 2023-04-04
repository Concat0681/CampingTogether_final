package kr.or.iei.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {

	private int noticeNo;
	private String noticeWriter;
	private	String noticeTitle;
	private String noticeContent;
	private String enrollDate;
}
