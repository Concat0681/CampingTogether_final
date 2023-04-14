package kr.or.iei.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopPhoto {

	private int fileNo;
	private int shopNo;
	private String filepath;
}
