package kr.or.iei.blacklist.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Blacklist {
	private int blacklistNo;
	private int usedBoardNo;
	private String memberId;
	private String blacklistMemberId;
	private int blacklistType;
	private String blacklistContent;
	private int blacklistStatus;
	private String regDate;
	private ArrayList<BlacklistPhoto> photolist;
	private int rnum;
	
	private int blackUsedBoardNo;
	private String blackUsedBoardTitle;
	
	public String getBlacklistTypeText() {
		String category = "";
		if(blacklistType == 0) {
			category = "미발송";
		}else if(blacklistType == 1) {
			category = "상품불량";
		}else if(blacklistType == 2) {
			category = "기타";
		}
		return category;
	}
	
	public String getBlacklistStatusText() {
		String status = "";
		if(blacklistStatus == 0) {
			status = "처리대기";
		}else if(blacklistStatus == 1) {
			status = "처리완료";
		}else if(blacklistStatus == 2){
			status = "처리취소";
		}
		return status;
	}
}
