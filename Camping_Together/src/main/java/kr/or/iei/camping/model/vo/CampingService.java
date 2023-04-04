package kr.or.iei.camping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingService {
	private int campingServiceNo;
	private int campingNo;
	private String campingService;
}
