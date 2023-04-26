package kr.or.iei.camping.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingDeleteData {
	private Camping camping;
	private ArrayList<CampingRoomFileVO> campingRoomFileList;
}
