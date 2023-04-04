package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingRoomService {
	private int campingRoomServiceNo;
	private int campingNo;
	private String campingRoomService;
}
