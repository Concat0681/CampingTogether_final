package kr.or.iei.camping.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingListPageData {
	
	private ArrayList<Camping> list;
	private ArrayList<Camping> allList;
	private String pageNavi;
}
