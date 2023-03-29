package kr.or.iei.member.model.vo;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberDate;
	private String memberPhone;
	private int memberPoint;
	private String memberAddr;
	private String memberPhoto;
	private String memberEmail;
	private String memberGrade;
	private String memberName;
	
}
