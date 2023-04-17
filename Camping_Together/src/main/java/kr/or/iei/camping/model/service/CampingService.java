package kr.or.iei.camping.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import kr.or.iei.camping.model.vo.SellCampingList;
import kr.or.iei.camping.model.vo.SellCampingListData;

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
		map.put("campingSido", camping.getCampingSido());
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
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item'onclick='sendNavi("+(pageNo-1)+")'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li><a class='page-item' onclick='sendNavi("+pageNo+")'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li><a class='page-item' onclick='sendNavi("+(pageNo)+")'><span class='material-symbols-outlined'>chevron_right</span></a></li>";
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("campingNo", campingNo);
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
	
	public SellCampingListData getSellCampingList(String memberId, int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		ArrayList<SellCampingList> campingList = dao. getSellCampingList(map);
		int totalCount = dao.selectCampingCount(map);
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 5;
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2 ;
		}
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item'onclick='sendNavi("+(pageNo-1)+")'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li><a class='page-item' onclick='sendNavi("+pageNo+")'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li><a class='page-item' onclick='sendNavi("+(pageNo)+")'><span class='material-symbols-outlined'>chevron_right</span></a></li>";
		}
		SellCampingListData scld = new SellCampingListData();
		scld.setCampingList(campingList);
		scld.setPageNavi(pageNavi);
		return scld;
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
		if(crv.size() > 0) {
			for(CampingReview r : crv) {
				ArrayList<CampingReviewFileVO> fileList = dao.selectCampingReviewPhoto(r.getCampingReviewNo());
				r.setFileList(fileList);
			}
		}
		crd.setReviewList(crv);
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

	public CampingReviewData selectReviewCommentList(int campingNo) {
		CampingReviewData reviewCommentList = new CampingReviewData();
		ArrayList<CampingReview> crv = dao.selectReviewCommentList(campingNo);
		reviewCommentList.setReviewCommentList(crv);
		return reviewCommentList;
	}

	public ArrayList<CampingReviewFileVO> deleteCampingReview(int campingReviewNo) {
		ArrayList<CampingReviewFileVO> fileList = dao.selectCampingReviewFile(campingReviewNo);
		int result = dao.deleteCampingReview(campingReviewNo);
		if(result>0) {
			return fileList;
		}else {
			return null;
		}
	}

	public int deleteCampingReviewComment(int campingReviewNo) {
		int result = dao.deleteCampingReviewComment(campingReviewNo);
		return result;
	}

	public int updateReviewComment(CampingReview crv) {
		int result = dao.updateReviewComment(crv);
		if(result > 0) {
			return result;
		}else {
			return 0;
		}
	}

	public int selectReviewCount() {
		int selectReviewCount = dao.selectReviewCount();
		return selectReviewCount;
	}

	public int selectReviewCommentCount() {
		int selectReviewCommentCount = dao.selectReviewCommentCount();
		return selectReviewCommentCount;
	}

	public int selectcampingReviewRatingAvg() {
		int campingReviewRatingAvg = dao.selectcampingReviewRatingAvg();
		return campingReviewRatingAvg;
	}

	
}
