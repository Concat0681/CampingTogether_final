package kr.or.iei.usedBoard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedWishList {
	private int usedWishNo;
	private int usedBoardNo;
	private String memberId;
}
