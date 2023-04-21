package kr.or.iei.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShopOrder {

	private int orderNo;
	private String orderName;
	private String orderPhone;
	private String orderAddr;
	private String orderComment;
	private int totalPrice;
	private int shopNo;
	private String memberId;
	private int sellCount;
	private String orderDate;
}
