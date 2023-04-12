package kr.or.iei.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {
	private int campingReservationNo;
	private int memberNo;
	private int campingRoomNo;
	private String checkIn;
	private String checkOut;
	private int status;
}
