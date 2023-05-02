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
	private String campingRoomTitle;
 	private String campingRoomContent;
	private int campingRoomPrice;
	private int campingRoomCount;
	private int campingRoomMaxPplCount;
	private ArrayList<String> campingRoomTypeList;
	private String campingRoomType;
	private ArrayList<CampingRoomFileVO> fileList;
	private String checkIn;
	private String checkOut;
}
