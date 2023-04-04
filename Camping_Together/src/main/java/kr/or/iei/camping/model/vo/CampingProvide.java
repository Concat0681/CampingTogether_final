package kr.or.iei.camping.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingProvide {

	private ArrayList<CampingService> campingServiceList;
	private ArrayList<CampingRoomService> campingRoomServiceList;
	private ArrayList<CampingEtc> campingEtcList;

}
