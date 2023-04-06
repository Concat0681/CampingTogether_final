package kr.or.iei.member.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor


public class MemberPageData {
	
	private ArrayList<Member> list;
	private String pageNavi;

}
