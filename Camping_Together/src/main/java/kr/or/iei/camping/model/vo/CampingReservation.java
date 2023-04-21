package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingReservation {
	
	private int campingReservationNo;
	private int memberNo;
	private int campingRoomNo;
	private String checkIn;
	private String checkOut;
	private int status;
}
