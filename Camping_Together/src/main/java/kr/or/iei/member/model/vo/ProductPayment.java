package kr.or.iei.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductPayment {
	private String rnum;
	private int shopNo;
	private String productName;
	private int buyCount;
	private String productPaymentDate;
	private int totalPrice;
	
}
