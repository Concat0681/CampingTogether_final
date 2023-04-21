package kr.or.iei.member.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@AllArgsConstructor
@NoArgsConstructor
public class AllMemberPageData {
	
	private ArrayList<Member> list;
	private String pageNavi;
	private int totalCount;

}
