package kr.or.iei.board.food.model.vo;

import java.util.ArrayList;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardFood {
	private int boardFoodNo;
	private String boardFoodWriter;
	private String boardFoodTitle;
	private String boardFoodContent;
	private int	readCount;
	private String enrollDate;
	private String filepath;
	private int fileNo;
	private ArrayList<FileVO> fileList;
	private int foodCommentRef;
}
