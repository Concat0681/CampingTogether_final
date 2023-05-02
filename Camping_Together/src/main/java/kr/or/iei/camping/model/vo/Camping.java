package kr.or.iei.camping.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Camping {
	
	private int campingNo;
	private String memberId;
	private String campingTitle;
	private String campingContent;
	private String campingSido;
	private String campingAddr;
	private String campingAddrDetail;
	private String campingPhone;
	private double avgReviewRating;
	private int countReviewRating;
	private int maxRoomPrice;
	private String filepath;
	private int campingBookmarkNo;
	private ArrayList<CampingProvideService> campingProvideServiceList;
	private ArrayList<CampingRoomService> campingRoomServiceList;
	private ArrayList<CampingEtc> campingEtcList;
}
