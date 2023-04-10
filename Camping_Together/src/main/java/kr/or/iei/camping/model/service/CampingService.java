package kr.or.iei.camping.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.iei.camping.model.dao.CampingDao;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingEtc;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvideService;
import kr.or.iei.camping.model.vo.CampingReview;
import kr.or.iei.camping.model.vo.CampingReviewData;
import kr.or.iei.camping.model.vo.CampingReviewFileVO;
import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.camping.model.vo.ViewCampingData;
import kr.or.iei.camping.model.vo.CampingRoomFileVO;
import kr.or.iei.camping.model.vo.CampingRoomService;

@Service
public class CampingService {

	@Autowired
	private CampingDao dao;

	public int insertCamping(Camping c, CampingRoom cr, ArrayList<CampingRoomFileVO> fileList) {
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
				cr.setCampingNo(c.getCampingNo());
				result = dao.insertCampingRoom(cr);
				if(result > 0) {
					for(CampingRoomFileVO file : fileList) {
						file.setCampingRoomNo(cr.getCampingRoomNo());
						result += dao.insertCampingRoomPhoto(file);
					}
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
		map.put("campingEtcList", camping.getCampingEtcList());
		map.put("campingRoomServiceList", camping.getCampingRoomServiceList());
		map.put("campingProvideServiceList", camping.getCampingProvideServiceList());
		map.put("campingRoomTypeList", campingRoom.getCampingRoomTypeList());
		map.put("pplCount", campingRoom.getCampingRoomMaxPplCount());
		map.put("campingAddr", camping.getCampingAddr());
		ArrayList<Camping> list = dao.selectCampingListData(map);
		int totalCount = dao.selectCampingCount(map);
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 5;
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2 ;
		}
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a onclick='sendDetailSearch("+null+","+(pageNo-1)+")'>[이전]</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			} else {
				pageNavi += "<a onclick='sendDetailSearch("+null+","+pageNo+")'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a onclick='sendDetailSearch("+null+","+(pageNo)+")'>[다음]</a>";
		}
		map.put("start", null);
		map.put("end", null);
		ArrayList<Camping> allList = dao.selectCampingListData(map);
		CampingListPageData cpd = new CampingListPageData();
		cpd.setList(list);
		cpd.setPageNavi(pageNavi);
		cpd.setAllList(allList);
		return cpd;
	}

	public ViewCampingData selectOneCamping(int campingNo) {
		ViewCampingData vcd = new ViewCampingData();
		ArrayList<CampingRoomFileVO> fileList = new ArrayList<CampingRoomFileVO>();
		Camping camping = dao.selectOneCamping(campingNo);
		vcd.setCamping(camping);
		ArrayList<CampingRoom> campingRoomList = dao.selectAllCampingRoomList(campingNo);
		for(CampingRoom r : campingRoomList) {
			fileList = dao.selectCampingRoomFileList(r.getCampingRoomNo());
			r.setFileList(fileList);
		}
		vcd.setCampingRoomList(campingRoomList);
		return vcd;
	}
	
	public int insertCampingRoom(CampingRoom cr, ArrayList<CampingRoomFileVO> fileList) {
		int result = dao.insertCampingRoom(cr);
		if(result > 0) {
			for(CampingRoomFileVO file : fileList) {
				file.setCampingRoomNo(cr.getCampingRoomNo());
				result += dao.insertCampingRoomPhoto(file);
			}
		}
		return result;
	}

	public int insertCampingReview(CampingReview crv, ArrayList<CampingReviewFileVO> fileList) {
		int result = dao.insertCampingReview(crv);
		if(result > 0) {
			for(CampingReviewFileVO file : fileList) {
				file.setCampingReviewNo(crv.getCampingReviewNo());
				result += dao.insertCampingReviewPhoto(file);
			}
		}
		return result;
	}

	public CampingReviewData selectCampingReview(int campingNo) {
		CampingReviewData crd = new CampingReviewData();
		ArrayList<CampingReview> crv = dao.selectCampingReview(campingNo);
		crd.setReviewList(crv);
		if(crv != null) {
			List<Integer> campingReviewNoList = dao.selectCampingReviewNo(campingNo);
			int campingReviewNo = campingReviewNoList.get(0);
			ArrayList<CampingReviewFileVO> fileList = dao.selectCampingReviewPhoto(campingReviewNo);
			crd.setFileList(fileList);
		}
		return crd;
	}

	public int insertReviewComment(CampingReview crv) {
		int result = dao.insertReviewComment(crv);
		if(result > 0) {
			return result;
		}else {
			return 0;
		}
	}

	
}
