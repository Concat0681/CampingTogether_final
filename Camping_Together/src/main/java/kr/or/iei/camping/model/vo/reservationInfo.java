package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class reservationInfo {
	private String memberName;
	private String memberPhone;
	private String campingTitle;
	private String campingAddr;
	private String campingPaymentDate;
	private String checkIn;
	private String checkOut;
}
