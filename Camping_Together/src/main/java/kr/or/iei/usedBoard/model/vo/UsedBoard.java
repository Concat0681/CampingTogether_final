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
	
	public String getUsedBoardCategory() {
		String category = "";
		if(usedBoardCategory == 1) {
			category = "����/������ǰ";
		}else if(usedBoardCategory == 2) {
			category = "ķ��ī/ī��ݿ�ǰ";
		}else if(usedBoardCategory == 3) {
			category = "ȭ��/����/BBQ";
		}else if(usedBoardCategory == 4) {
			category = "����/������ǰ";
		}else if(usedBoardCategory == 5) {
			category = "��Ʈ/Ÿ��";
		}else if(usedBoardCategory == 6) {
			category = "ħ��/��Ʈ";
		}else if(usedBoardCategory == 7) {
			category = "���ڿ�ǰ";
		}else if(usedBoardCategory == 8) {
			category = "����ⱸ";
		}else if(usedBoardCategory == 9) {
			category = "��Ÿķ�ο�ǰ";
		}else if(usedBoardCategory == 10) {
			category = "��Ÿ��Ȱ��ǰ";
		}
		return category;
	}
	public String getUsedProductStatus() {
		if(usedProductStatus == 0) {
			return "�߰� ��ǰ";
		}else if(usedProductStatus == 1){
			return "�� ��ǰ";
		}
		return null;
	}
	public String getExchangeStatus() {
		if(exchangeStatus == 0) {
			return "��ȯ����";
		}else if(exchangeStatus == 1) {
			return "��ȯ�Ұ���";
		}
		return null;
	}
}


