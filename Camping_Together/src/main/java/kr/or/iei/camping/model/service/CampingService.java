package kr.or.iei.camping.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.camping.model.dao.CampingDao;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvide;
import kr.or.iei.camping.model.vo.CampingRoom;

@Service
public class CampingService {

	@Autowired
	private CampingDao dao;

	public int insertCamping(Camping c) {
		int result = dao.insertCamping(c);
		if(result > 0) {
			return result;
		}else {
			return 0;
		}
	}

	public CampingListPageData selectCampingListData(int reqPage, String order, CampingProvide campingProvide, CampingRoom campingRoom) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("order", order);
		map.put("campingEtc", campingProvide.getCampingEtc());
		map.put("campingRoomService", campingProvide.getCampingRoomService());
		map.put("campingService", campingProvide.getCampingService());
		map.put("campingRoomType", campingRoom.getCampingRoomType());
		map.put("pplCount", campingRoom.getCampingRoomMaxPplCount());
		
		ArrayList<Camping> list = dao.selectCampingListData(map);
		int totalCount = dao.selectCampingCount();
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 5;
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2 ;
		}
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[�씠�쟾]</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			} else {
				pageNavi += "<a href='/boardList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo)+"'>[�떎�쓬]</a>";
		}
		CampingListPageData cpd = new CampingListPageData();
		cpd.setList(list);
		cpd.setPageNavi(pageNavi);
		return cpd;
	}
}
