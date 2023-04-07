package kr.or.iei.board.food.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FoodComment {
	private int foodCommentNo;
	private String foodCommentWriter;
	private int boardFoodRef;
	private int foodCommentRef;
	private String foodCommentContent;
	private String foodCommentDate;
}
