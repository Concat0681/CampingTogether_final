package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CampingReservationCheck {

	private int campingReservationNo;
	private String campingTitle;
	private String campingRoomType;
	private String campingRoomPrice;
	private String checkIn;
	private String checkOut;
	private String thumbnail;
	private String filepath;
}
