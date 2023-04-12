package kr.or.iei.inquiry.model.vo;

import java.util.ArrayList;

import kr.or.iei.notice.model.vo.Notice;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InquiryPageData {
	private ArrayList<Inquiry> list;
	private String pageNavi;
}
