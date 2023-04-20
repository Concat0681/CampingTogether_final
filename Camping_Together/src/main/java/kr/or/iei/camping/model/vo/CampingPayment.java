package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingPayment {

	private int campingPaymentNo;
	private int campingReservationNo;
	private String campingPaymentDate;
	private int status;
}
