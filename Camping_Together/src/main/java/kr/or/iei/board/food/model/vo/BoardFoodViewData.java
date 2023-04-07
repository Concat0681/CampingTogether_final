package kr.or.iei.board.food.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardFoodViewData {
	private BoardFood bf;
	private ArrayList<FoodComment> commentList;
	private ArrayList<FoodComment> recommentList;
}
