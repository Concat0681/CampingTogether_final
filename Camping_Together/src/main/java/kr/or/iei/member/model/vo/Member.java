package kr.or.iei.member.model.vo;

import lombok.NoArgsConstructor;

import java.util.ArrayList;

import kr.or.iei.board.food.model.vo.FileVO;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private String rnum;
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberDate;
	private String memberPhone;
	private String memberAddr;
	private String memberPhoto;
	private String memberEmail;
	private String memberGrade;
	private String memberName;
	private ArrayList<FileVO> fileList;
	
}
