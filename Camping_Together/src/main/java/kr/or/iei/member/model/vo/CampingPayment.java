package kr.or.iei.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingPayment {
//	private int campingPaymentNo;
//	private int campingReservationNo;
	private String campingPaymentDate;
//	private int status;
//	private int totalPrice;

	private int totalCount;
	private int campingNo;
	private String checkIn;
	private String checkOut;
	private int campingRoomNo;
	private int campingRoomPrice;
	private String campingRoomTitle;
}
