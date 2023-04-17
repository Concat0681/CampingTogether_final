package kr.or.iei.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class SellCampingList {
	private int rnum;
	private String campingTitle;
	private String cmapingSido;
	private String campingRoomTitle;
	private String filpath;
}
