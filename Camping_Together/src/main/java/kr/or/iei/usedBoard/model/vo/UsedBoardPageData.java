package kr.or.iei.usedBoard.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedBoardPageData {
	private ArrayList<UsedBoard> list;
	private String pageNavi;
}
