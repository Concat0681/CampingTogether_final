package kr.or.iei.member.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewPageData {
	private ArrayList<MyReview> list;
	private String pageNavi;
}
