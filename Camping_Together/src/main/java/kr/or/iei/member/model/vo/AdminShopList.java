package kr.or.iei.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class AdminShopList {
	private String shopTitle;
	private int shopPrice;
	private int count;
	private String filepath;
	private int score;
	
	
}
