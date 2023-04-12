package kr.or.iei.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class FileVO {
	private int profileNo;
	private int memberNo;
	private String profileFilename;
	private String profileFilepath;
}
