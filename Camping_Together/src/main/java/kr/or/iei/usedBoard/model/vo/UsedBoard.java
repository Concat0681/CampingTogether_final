package kr.or.iei.usedBoard.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedBoard {
	private int usedBoardNo;
	private String usedBoardWriter;
	private String usedBoardTitle;
	private String usedBoardContent;
	private int usedBoardCategory;
	private int usedBoardStatus;
	private int usedProductStatus;
	private int exchangeStatus;
	private int usedProductPrice;
	private int usedDeliveryStatus;
	private String usedTradeLocation;
	private int readCount;
	private String regDate;
	private ArrayList<UsedBoardPhoto> usedBoardPhotoList;
	private String thumbnail;
	
	public String getUsedBoardCategoryText() {
		String category = "";
		if(usedBoardCategory == 1) {
			category = "전기/전자제품";
		}else if(usedBoardCategory == 2) {
			category = "캠핑카/카라반용품";
		}else if(usedBoardCategory == 3) {
			category = "화로/버너/BBQ";
		}else if(usedBoardCategory == 4) {
			category = "안전/위생용품";
		}else if(usedBoardCategory == 5) {
			category = "텐트/타프";
		}else if(usedBoardCategory == 6) {
			category = "침낭/매트";
		}else if(usedBoardCategory == 7) {
			category = "차박용품";
		}else if(usedBoardCategory == 8) {
			category = "조명기구";
		}else if(usedBoardCategory == 9) {
			category = "기타캠핑용품";
		}else if(usedBoardCategory == 10) {
			category = "기타생활용품";
		}
		return category;
	}
	public String getUsedProductStatusText() {
		if(usedProductStatus == 0) {
			return "중고 상품";
		}else if(usedProductStatus == 1){
			return "새 상품";
		}
		return null;
	}
	public String getExchangeStatusText() {
		if(exchangeStatus == 0) {
			return "교환가능";
		}else if(exchangeStatus == 1) {
			return "교환불가능";
		}
		return null;
	}
}


