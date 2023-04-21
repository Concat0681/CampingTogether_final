package kr.or.iei.blacklist.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BlacklistPhoto {
	private int blacklistPhotoNo;
	private int blacklistNo;
	private String filename;
	private String filepath;
}
