package kr.or.iei.board.food.model.vo;

import java.util.ArrayList;

import kr.or.iei.notice.model.vo.Notice;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardFoodPageData {
	private ArrayList<BoardFood> list;
	private String pageNavi;
}
