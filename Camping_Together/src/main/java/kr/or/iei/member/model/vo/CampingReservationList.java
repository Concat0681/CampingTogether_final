package kr.or.iei.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class CampingReservationList {
	private String campingTitle;
	private String campingRoomTitle;
	private String checkIn;
	private String checkOut;
	//private String memberId;
	private int price;
	private String memberId;
}
