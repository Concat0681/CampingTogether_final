package kr.or.iei.board.food.model.vo;

import com.sun.org.glassfish.gmbal.DescriptorFields;

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
}
