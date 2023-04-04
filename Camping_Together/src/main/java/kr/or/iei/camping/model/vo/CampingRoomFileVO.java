package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingRoomFileVO {
	private int campingRoomPhotoNo;
	private int campingRoomNo;
	private String filepath;
}
