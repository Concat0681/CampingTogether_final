package kr.or.iei.usedBoard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedBoardPhoto {
	private int fileNo;
	private int usedBoardNo;
	private String filepath;

}
