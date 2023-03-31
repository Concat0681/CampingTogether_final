package kr.or.iei.camping.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingRoom {

	private int campingRoomNo;
	private int campingNo;
 	private String campingRoomContent;
	private int campingRoomPrice;
	private int campingRoomCount;
	private int campingRoomMaxPplCount;
	private int roomTitle;
	private ArrayList<String> campingRoomType;
}