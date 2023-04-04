package kr.or.iei.camping.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.camping.model.dao.CampingDao;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingEtc;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvideService;
import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.camping.model.vo.ViewCampingData;
import kr.or.iei.camping.model.vo.CampingRoomFileVO;
import kr.or.iei.camping.model.vo.CampingRoomService;

@Service
public class CampingService {

	@Autowired
	private CampingDao dao;

	public int insertCamping(Camping c) {
		int result = dao.insertCamping(c);
		if(result > 0) {
			for(CampingProvideService cps : c.getCampingProvideServiceList()) {
				cps.setCampingNo(c.getCampingNo());
				result += dao.insertCampingProvideService(cps);
			}
			for(CampingRoomService crs : c.getCampingRoomServiceList()) {
				crs.setCampingNo(c.getCampingNo());
				result += dao.insertCampingRoomService(crs);
			}
			for(CampingEtc ce : c.getCampingEtcList()) {
				ce.setCampingNo(c.getCampingNo());
				result += dao.insertCampingEtc(ce);
			}
			return result;
		}else {
			return 0;
		}
	}

	public CampingListPageData selectCampingListData(int reqPage, String order, Camping camping, CampingRoom campingRoom) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("order", order);
		System.out.println(camping.getCampingEtcList());
		map.put("campingEtcList", camping.getCampingEtcList());
		map.put("campingRoomServiceList", camping.getCampingRoomServiceList());
		map.put("campingProvideServiceList", camping.getCampingProvideServiceList());
		map.put("campingRoomTypeList", campingRoom.getCampingRoomTypeList());
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
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
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
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo)+"'>[다음]</a>";
		}
		CampingListPageData cpd = new CampingListPageData();
		cpd.setList(list);
		cpd.setPageNavi(pageNavi);
		return cpd;
	}

	public ViewCampingData selectOneCamping(int campingNo) {
		ViewCampingData vcd = new ViewCampingData();
		Camping camping = dao.selectOneCamping(campingNo);
		vcd.setCamping(camping);
		ArrayList<CampingRoom> campingRoomList = dao.selectAllCampingRoomList(campingNo);
		vcd.setCampingRoomList(campingRoomList);
		return vcd;
	}
	
	public int insertCampingRoom(CampingRoom cr, ArrayList<CampingRoomFileVO> fileList, int campingNo) {
		cr.setCampingNo(campingNo);
		int result = dao.insertCampingRoom(cr);
		if(result > 0) {
			for(CampingRoomFileVO file : fileList) {
				file.setCampingRoomNo(cr.getCampingRoomNo());
				result += dao.insertCampingRoomPhoto(file);
			}
		}
		return result;
	}
}
