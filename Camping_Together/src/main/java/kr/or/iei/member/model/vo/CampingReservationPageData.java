package kr.or.iei.member.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingReservationPageData {

	private ArrayList<CampingReservationList> list;
	private String pageNavi;
	private int totalCount;
}
