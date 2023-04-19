package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellCampingList {
	private int rnum;
	private int campingNo;
	private int campingRoomNo;
	private String campingTitle;
	private String campingSido;
	private String campingRoomTitle;
	private String filepath;
}
