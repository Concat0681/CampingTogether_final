package kr.or.iei.usedBoard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedBoardComment {
	private int usedBoardCommentNo;
	private int usedBoardNo;
	private String usedBoardCommentWriter;
	private String usedBoardCommentContent;
	private String regDate;
	private int commentCount;
	
	private String profilePath;
	
	public String getUsedBoardCommentContentBr() {
		return usedBoardCommentContent.replaceAll("\r\n", "<br>");
	}
}
