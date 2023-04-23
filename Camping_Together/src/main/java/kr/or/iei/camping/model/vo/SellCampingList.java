package kr.or.iei.camping.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellCampingList {
	private int rnum;
	private String memberId;
	private int campingNo;
	private String campingTitle;
	private String campingSido;
	private String filepath;
	private ArrayList<CampingRoom> campingRoomList;
}
