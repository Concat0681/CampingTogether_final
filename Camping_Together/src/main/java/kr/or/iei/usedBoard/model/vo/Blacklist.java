package kr.or.iei.usedBoard.model.vo;

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
	private String regDate;
	private ArrayList<BlacklistPhoto> photolist;
}