package kr.or.iei.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShopPayment {
	
	private int paymentNo;
	private int orderNo;
	private String memberId;
}
