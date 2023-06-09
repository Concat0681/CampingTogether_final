package kr.or.iei.camping.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileManager;
import kr.or.iei.camping.model.service.CampingService;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingDeleteData;
import kr.or.iei.camping.model.vo.CampingEtc;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingPayment;
import kr.or.iei.camping.model.vo.CampingProvideService;
import kr.or.iei.camping.model.vo.CampingReservation;
import kr.or.iei.camping.model.vo.CampingReservationCheck;
import kr.or.iei.camping.model.vo.CampingReview;
import kr.or.iei.camping.model.vo.CampingReviewData;
import kr.or.iei.camping.model.vo.CampingReviewFileVO;
import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.camping.model.vo.CampingRoomFileVO;
import kr.or.iei.camping.model.vo.CampingRoomService;
import kr.or.iei.camping.model.vo.ViewCampingData;
import kr.or.iei.camping.model.vo.reservationInfo;
import kr.or.iei.member.model.vo.Member;

@Controller
public class CampingController {

	@Autowired
	private CampingService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/campingWriteFrm.do")
	public String campingWriteFrm() {
		return "camping/campingWriteFrm";
	}
	
	@RequestMapping(value="/campingListMain.do")
	public String campingListMain(String memberId, Model model) {
		int reqPage = 1;
		String order = "avgReviewRating";
		CampingRoom campingRoom = new CampingRoom();
		Camping camping = new Camping();
		if(memberId != null) {
			camping.setMemberId(memberId);
		}
		CampingListPageData cpd = service.selectCampingListData(reqPage, order, camping, campingRoom);
		for(Camping c : cpd.getList()) {
//			System.out.println(c.getCampingBookmarkNo());
		}
		System.out.println();
		order = "new";
		CampingListPageData newCpd = service.selectCampingListData(reqPage, order, camping, campingRoom);
		model.addAttribute("newCampingList",newCpd.getList());
		model.addAttribute("ratingCampingList", cpd.getList());
		return "camping/campingListMain";
	}
	
	@RequestMapping(value="/campingList.do")
	public String campingList(Camping c, String campingSido, String cityNameKR, String cityNameEN,int reqPage, String order, String pplCount, String checkIn, String checkOut, Model model) {
		CampingRoom campingRoom = new CampingRoom();
		Camping camping = new Camping();
		System.out.println(checkIn);
		if(checkIn != null && checkIn.equals("")) {
			campingRoom.setCheckIn(checkIn);
			campingRoom.setCheckOut(checkOut);
		}
		if(cityNameKR.equals("")) {
			camping.setCampingSido(campingSido);
		} else {
			camping.setCampingAddr(cityNameKR);
		}
		campingRoom.setCampingRoomMaxPplCount(Integer.parseInt(pplCount));
		CampingListPageData cpd = service.selectCampingListData(reqPage, order, camping, campingRoom);
		
//		CampingRoom CampingRoom2 = service.selectCampingRoom(c); 
//		System.out.println(CampingRoom2);
//		System.out.println(c);
		model.addAttribute("cityNameKR", cityNameKR);
		model.addAttribute("cityNameEN", cityNameEN);
		model.addAttribute("list", cpd.getList()); 
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("allList", cpd.getAllList());
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("pplCount", pplCount);
		model.addAttribute("campingSido", campingSido);
		return "camping/campingList";
	}
	
	@ResponseBody
	@RequestMapping(value="/detailSearchCamping.do", produces="application/json;charset=utf-8")
	public String detailSearchCamping(String order, String campingTypeStr, String campingServiceStr, String campingRoomServiceStr, String campingEtcStr, String pplCount, String cityAddr, String campingSido, int reqPage, String checkIn, String checkOut) {
		if(reqPage == 0) {
			reqPage = 1;
		}
		CampingRoom campingRoom = new CampingRoom();
		campingRoom.setCheckIn(checkIn);
		campingRoom.setCheckOut(checkOut);
		if(campingTypeStr != "") {
			String[] campingType = campingTypeStr.split(",");
			ArrayList<String> arr1 = new ArrayList<String>();
			for(String str : campingType) {
				arr1.add(str);
			}
			campingRoom.setCampingRoomTypeList(arr1);
		}
		Camping camping = campingProvideSetter(campingServiceStr, campingRoomServiceStr, campingEtcStr);
		if(cityAddr == "") {
			camping.setCampingSido(campingSido);
		} else {
			camping.setCampingAddr(cityAddr);
		}
		campingRoom.setCampingRoomMaxPplCount(Integer.parseInt(pplCount));
		CampingListPageData cpd = service.selectCampingListData(reqPage, order, camping, campingRoom);
		cpd.setCheckIn(checkIn);
		cpd.setCheckOut(checkOut);
		return new Gson().toJson(cpd);
	}
	
	@RequestMapping(value="/campingWrite.do")
	public String campingWrite(Camping c, MultipartFile[] campingFilepath, HttpServletRequest requset, String[] campingService, String[] campingRoomService, String[] campingEtc, CampingRoom cr, MultipartFile[] campingRoomFilepath, Model model) {
		if(campingService != null) {
			ArrayList<CampingProvideService> campingServicelist = new ArrayList<CampingProvideService>();
			for(String str : campingService) {
				CampingProvideService cps = new CampingProvideService();
				cps.setCampingService(str);
				campingServicelist.add(cps);
			}
			c.setCampingProvideServiceList(campingServicelist);
		}
		if(campingRoomService != null) {
			ArrayList<CampingRoomService> campingRoomServicelist = new ArrayList<CampingRoomService>();
			for(String str : campingRoomService) {
				CampingRoomService crs = new CampingRoomService();
				crs.setCampingRoomService(str);
				campingRoomServicelist.add(crs);
			}
			c.setCampingRoomServiceList(campingRoomServicelist);
		}
		if(campingEtc != null) {
			ArrayList<CampingEtc> campingEtclist = new ArrayList<CampingEtc>();
			for(String str : campingEtc) {
				CampingEtc ce = new CampingEtc();
				ce.setCampingEtc(str);
				campingEtclist.add(ce);
			}
			c.setCampingEtcList(campingEtclist);
		}
		if(!campingFilepath[0].isEmpty()) {
			String savePath = requset.getSession().getServletContext().getRealPath("/resources/upload/camping/");
			for(MultipartFile file : campingFilepath) {
				String filepath = manager.upload(savePath, file);
				c.setFilepath(filepath);
			}
		}
		ArrayList<CampingRoomFileVO> fileList = new ArrayList<CampingRoomFileVO>();
		if(!campingRoomFilepath[0].isEmpty()) {
			String savePath = requset.getSession().getServletContext().getRealPath("/resources/upload/campingRoom/");
			for(MultipartFile file : campingRoomFilepath) {
				String filepath = manager.upload(savePath, file);
				CampingRoomFileVO campingRoomFileVO = new CampingRoomFileVO();
				campingRoomFileVO.setFilepath(filepath);
				fileList.add(campingRoomFileVO);
			}
		}
		int result = service.insertCamping(c, cr, fileList);
		if(result > 0) {
			model.addAttribute("title", "캠핑장 등록 성공");
			model.addAttribute("msg", "캠핑장 등록에 성공하셨습니다");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+c.getMemberId());
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "캠핑장 등록 실패");
			model.addAttribute("msg", "캠핑장 등록에 실패하셨습니다. 다시 시도해주세요.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+c.getMemberId());
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value="/campingRoomWriteFrm.do")
	public String campingRoomWriteFrm(int campingNo, Model model, String campingTitle) {
		model.addAttribute("campingNo",campingNo);
		model.addAttribute("campingTitle", campingTitle);
		return "camping/campingRoomWriteFrm";
	}
	
	@RequestMapping(value="/viewCamping.do")
	public String viewCamping(CampingReservation cr, String checkIn, String checkOut, int campingNo, String memberId, Model model) {
		ViewCampingData vcd = service.selectOneCamping(campingNo, memberId);
		ArrayList<CampingReservation> reservationList = new ArrayList<CampingReservation>();
		for(CampingRoom room : vcd.getCampingRoomList()) {
			cr.setCampingRoomNo(room.getCampingRoomNo());
			CampingReservation cre = service.selectReservationList(cr);
			reservationList.add(cre);
		}
			
		CampingReviewData crd = service.selectCampingReview(campingNo);
		CampingReviewData reviewCommentList = service.selectReviewCommentList(campingNo);
//		CampingReservation campingReservation = service.selectReservation(cr);
//		System.out.println(campingReservation);
		int campingReviewCount = service.selectReviewCount(campingNo);
		int campingReviewCommentCount = service.selectReviewCommentCount(campingNo);
		int campingReviewRatingAvg = service.selectcampingReviewRatingAvg(campingNo);
		model.addAttribute("campingReviewRatingAvg",campingReviewRatingAvg);
		model.addAttribute("campingReviewCommentCount",campingReviewCommentCount);
		model.addAttribute("campingReviewCount",campingReviewCount);
		model.addAttribute("camping" , vcd.getCamping());
		model.addAttribute("campingRoomList", vcd.getCampingRoomList());
		model.addAttribute("campingReview", crd.getReviewList());
		model.addAttribute("campingReviewComment", reviewCommentList.getReviewCommentList());
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
//		model.addAttribute("campingReservation", campingReservation);
		model.addAttribute("reservationList",reservationList);
//		System.out.println(reservationList);
		return "camping/viewCamping";
	}
 Camping campingProvideSetter(String campingServiceStr, String campingRoomServiceStr, String campingEtcStr) {
		Camping camping = new Camping();
		if(campingServiceStr != "") {
			String[] campingService = campingServiceStr.split(",");
			ArrayList<CampingProvideService> list = new ArrayList<CampingProvideService>();
			for(String str : campingService) {
				CampingProvideService cps = new CampingProvideService();
				cps.setCampingService(str);
				list.add(cps);
			}
			camping.setCampingProvideServiceList(list);
		}
		if(campingRoomServiceStr != "") {
			String[] campingRoomService = campingRoomServiceStr.split(",");
			ArrayList<CampingRoomService> list = new ArrayList<CampingRoomService>();
			for(String str : campingRoomService) {
				CampingRoomService crs = new CampingRoomService();
				crs.setCampingRoomService(str);
				list.add(crs);
			}
			camping.setCampingRoomServiceList(list);
		}
		if(campingRoomServiceStr != "") {
			String[] campingEtc = campingEtcStr.split(",");
			ArrayList<CampingEtc> list = new ArrayList<CampingEtc>();
			for(String str : campingEtc) {
				CampingEtc cEtc = new CampingEtc();
				cEtc.setCampingEtc(str);
				list.add(cEtc);
			}
			camping.setCampingEtcList(list);
		}
		return camping;
	}
	
	
	@RequestMapping(value="/campingRoomWrite.do")
	public String campingRoomWrite(CampingRoom cr,String memberId, MultipartFile[] campingRoomFilepath, HttpServletRequest request, Model model) {
		ArrayList<CampingRoomFileVO> fileList = new ArrayList<CampingRoomFileVO>();
		if(!campingRoomFilepath[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/campingRoom/");
			for(MultipartFile file : campingRoomFilepath) {
				String filepath = manager.upload(savePath, file);
				CampingRoomFileVO campingRoomFileVO = new CampingRoomFileVO();
				campingRoomFileVO.setFilepath(filepath);
				fileList.add(campingRoomFileVO);
			}
		}
		int result = service.insertCampingRoom(cr, fileList);
		if(result == (fileList.size()+1)) {
			model.addAttribute("title", "캠핑 등록 성공");
			model.addAttribute("msg", "캠핑 등록에 성공하셨습니다");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "캠핑 등록 실패");
			model.addAttribute("msg", "캠핑 등록에 실패하셨습니다. 다시 시도해주세요.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}
	}
	
	
	@RequestMapping(value="/campingReview.do")
	public String campingReview() {
		return "campingReview/campingReview";
	}
	
	@RequestMapping(value="/campingReviewWrite.do")
	public String campingReviewWrite(CampingReview crv, MultipartFile[] campingReviewFilepath, HttpServletRequest request, int campingNo, Model model) {
		ArrayList<CampingReviewFileVO> fileList = new ArrayList<CampingReviewFileVO>();
		if(!campingReviewFilepath[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/campingReview/");
			for(MultipartFile file : campingReviewFilepath) {
				String filepath = manager.upload(savePath, file);
				CampingReviewFileVO campingReviewFileVO = new CampingReviewFileVO();
				campingReviewFileVO.setFilepath(filepath);
				fileList.add(campingReviewFileVO);
			}
		}
		crv.setCampingNo(campingNo);
		int result = service.insertCampingReview(crv, fileList);
		if(result == (fileList.size()+1)) {
			model.addAttribute("title", "리뷰 작성 성공");
			model.addAttribute("msg", "리뷰를 작성하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+campingNo);
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "리뷰 작성 실패");
			model.addAttribute("msg", "리뷰 작성 실패하셨습니다.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+campingNo);
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value="/insertReviewComment.do")
	public String insertReviewComment(CampingReview crv, Model model) {
		int result = service.insertReviewComment(crv);
		if(result > 0) {
			model.addAttribute("title", "댓글 작성 성공");
			model.addAttribute("msg", "댓글 작성에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+crv.getCampingNo());
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "댓글 작성 실패");
			model.addAttribute("msg", "댓글 작성 실패하셨습니다.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+crv.getCampingNo());
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value="/deleteCampingReview.do")
	public String deleteCampingReview(int campingNo, int campingReviewNo, HttpServletRequest request, Model model) {
		ArrayList<CampingReviewFileVO> list = service.deleteCampingReview(campingReviewNo);
		if(list == null) {
			model.addAttribute("title", "리뷰 삭제 실패");
			model.addAttribute("msg", "리뷰 삭제에 실패하셨습니다.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+campingNo);
			return "common/modalAlert";
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/campingReview/");
			for(CampingReviewFileVO file : list) {
				manager.deleteFile(savePath, file.getFilepath());
			}
			model.addAttribute("title", "리뷰 삭제 성공");
			model.addAttribute("msg", "리뷰 삭제에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+campingNo);
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value="/deleteCampingReviewComment.do")
	public String deleteCampingReviewComment(int campingNo,int campingReviewNo, Model model) {
		int result = service.deleteCampingReviewComment(campingReviewNo);
		if(result > 0) {
			model.addAttribute("title", "댓글 삭제 성공");
			model.addAttribute("msg", "댓글 삭제에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+campingNo);
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "댓글 삭제 실패");
			model.addAttribute("msg", "댓글 삭제에 실패하셨습니다.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+campingNo);
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value="/updateReviewComment.do")
	public String updateReviewComment(CampingReview crv, Model model) {
		int result = service.updateReviewComment(crv);
		if(result > 0) {
			model.addAttribute("title", "댓글 수정 성공");
			model.addAttribute("msg", "댓글 수정에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+crv.getCampingNo());
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "댓글 수정 실패");
			model.addAttribute("msg", "댓글 수정에 실패하셨습니다.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+crv.getCampingNo());
			return "common/modalAlert";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/getReviewInfo.do", produces = "application/json;charset=utf-8")
	public String getReviewInfo(int campingReviewNo) {
		CampingReview cr = service.getReviewInfo(campingReviewNo);
		System.out.println(cr);
		return new Gson().toJson(cr);
	}
	
	@RequestMapping(value="/updateCampingReview.do")
	public String updateCampingReview(CampingReview crv,int[] campingReviewPhotoNo, String[] filepath, MultipartFile[] campingReviewFilepath, HttpServletRequest request, Model model) {
		ArrayList<CampingReviewFileVO> fileList = new ArrayList<CampingReviewFileVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/campingReview/");
		if(!campingReviewFilepath[0].isEmpty()) {
			for(MultipartFile file : campingReviewFilepath) {
				String upfilepath = manager.upload(savePath, file);
				
				CampingReviewFileVO fileVO = new CampingReviewFileVO();
				fileVO.setFilepath(upfilepath);
				fileList.add(fileVO);
			}
		}
		int result = service.updateCampingReview(crv, fileList, campingReviewPhotoNo);
		if(campingReviewPhotoNo != null && (result == (fileList.size()+campingReviewPhotoNo.length + 1))) {
			for(String delFile : filepath) {
				manager.deleteFile(savePath, delFile);
			}
			model.addAttribute("title", "리뷰 수정 성공");
			model.addAttribute("msg", "리뷰 수정에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+crv.getCampingNo());
			return "common/modalAlert";
		}else if(campingReviewPhotoNo == null && (result == fileList.size()+1)){
			model.addAttribute("title", "리뷰 수정 성공");
			model.addAttribute("msg", "리뷰 수정에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+crv.getCampingNo());
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "리뷰 수정 실패");
			model.addAttribute("msg", "리뷰 수정에 실패하셨습니다.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/viewCamping.do?campingNo="+crv.getCampingNo());
			return "common/modalAlert";
		}
	}
	
	
	@RequestMapping(value="/deleteCampingRoom.do")
	public String deleteCampingRoom(int campingRoomNo,String memberId, int campingNo, HttpServletRequest request, Model model) {
		ArrayList<CampingRoomFileVO> list = service.deleteCampingRoom(campingRoomNo);
		if(list == null) {
			model.addAttribute("title", "캠핑 삭제 실패");
			model.addAttribute("msg", "캠핑 삭제에 실패하셨습니다. 다시 시도해주세요.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/campingRoom/");
			for(CampingRoomFileVO file : list) {
				manager.deleteFile(savePath, file.getFilepath());
			}
			model.addAttribute("title", "캠핑 삭제 성공");
			model.addAttribute("msg", "캠핑 삭제에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value="/updateCampingRoomFrm.do")
	public String updateCampingRoomFrm(int campingRoomNo,String memberId, Model model) {
		CampingRoom cr = service.updateCampingRoomFrm(campingRoomNo);
		model.addAttribute("campingRoom",cr);
		model.addAttribute("filePaths", cr.getFileList());
		return "camping/updateCampingRoomFrm";
	}

	@RequestMapping(value="/updateCampingRoom.do")
	public String updateCampingRoom(CampingRoom cr,String memberId,int[] campingRoomPhotoNo, String[] filepath, MultipartFile[] campingRoomFile, HttpServletRequest request, Model model) {
		ArrayList<CampingRoomFileVO> fileList = new ArrayList<CampingRoomFileVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/campingRoom/");
		if(!campingRoomFile[0].isEmpty()) {
			for(MultipartFile file : campingRoomFile) {
				String upfilepath = manager.upload(savePath, file);
				
				CampingRoomFileVO fileVO = new CampingRoomFileVO();
				fileVO.setFilepath(upfilepath);
				fileList.add(fileVO);
			}
		}
		int result = service.updateCampingRoom(cr, fileList, campingRoomPhotoNo);
		if(campingRoomPhotoNo != null && (result == (fileList.size()+campingRoomPhotoNo.length + 1))) {
			model.addAttribute("title", "캠핑 수정 성공");
			model.addAttribute("msg", "캠핑 수정에 성공하셨습니다");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}else if(campingRoomPhotoNo == null && (result == fileList.size()+1)){
			model.addAttribute("title", "캠핑 수정 성공");
			model.addAttribute("msg", "캠핑 수정에 성공하셨습니다");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "캠핑 수정 실패");
			model.addAttribute("msg", "캠핑 수정에 실패하셨습니다. 다시 시도해주세요.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value="/deleteCamping.do")
	public String deleteCamping(int campingNo, String memberId, HttpServletRequest request,Model model) {
		CampingDeleteData cdd = service.deleteCamping(campingNo);
		if(cdd == null) {
			model.addAttribute("title", "캠핑장 삭제 실패");
			model.addAttribute("msg", "캠핑장 삭제에 실패하셨습니다. 다시 시도해주세요.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/campingRoom/");
			for(CampingRoomFileVO file : cdd.getCampingRoomFileList()) {
				manager.deleteFile(savePath,file.getFilepath());
			}
			String savePath2 = request.getSession().getServletContext().getRealPath("/resources/upload/camping/");
			manager.deleteFile(savePath2,cdd.getCamping().getFilepath());
			model.addAttribute("title", "캠핑장 삭제 성공");
			model.addAttribute("msg", "캠핑장 삭제에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+memberId);
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value = "/reservationFrm.do")
	public String reservationFrm (Model model,String checkIn1, String checkOut1, String campingTitle, String campingType,int price, String addr, int campingRoomNo, int memberNo) {
		model.addAttribute("checkIn1", checkIn1);
		model.addAttribute("checkOut1", checkOut1);
		model.addAttribute("campingTitle", campingTitle);
		model.addAttribute("campingType", campingType);
		model.addAttribute("price", price);
		model.addAttribute("addr", addr);
		model.addAttribute("campingRoomNo", campingRoomNo);
		return "reservation/reservationFrm";
	}
	@RequestMapping(value = "/reservationInfo.do")
	public String reservationInfo(Model model, String campingTitle, String campingType,int campingRoomPrice, String campingAddr, String checkIn, String checkOut, int campingRoomNo, int memberNo ) {
		
		CampingReservation cr = service.selectRoomMemberNo(campingRoomNo);
		System.out.println("camping controller에서 cr값"+cr);
//		System.out.println(roomMemberNo);
		if(cr == null || cr.getCampingRoomNo() != campingRoomNo || cr.getCheckIn() != checkIn || cr.getCheckOut() != checkOut) {
			//예약 insert
			int result = service.campingReservation(memberNo,campingRoomNo, checkIn, checkOut);			
		} else {
			System.out.println("Camping 에서 if값 확인용 else로 빠짐");
		}
		
		
		//결제 select
		CampingPayment cp = service.campingPaymentDate(memberNo);
	
//		System.out.println(cp);
		model.addAttribute("campingTitle",campingTitle);
		model.addAttribute("campingAddr",campingAddr);
		model.addAttribute("checkIn",checkIn);
		model.addAttribute("checkOut",checkOut);
		model.addAttribute("campingPaymentDate", cp.getCampingPaymentDate());
		return "reservation/reservationInfo";			
//		return "rediect:/reservationInfo.do";			
		
	}
	
	@ResponseBody
	@RequestMapping(value="/insertCampingBookmark.do")
	public int insertCampingBookmark(int campingNo, String memberId) {
		int result = service.insertCampingBookmark(campingNo, memberId);
		int bookmarkNo = 0;
		if(result > 0) {
			bookmarkNo = service.selectLatestBookmarkNo();
		}
		return bookmarkNo;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteCampingBookmark.do")
	public int deleteCampingBookmark(int campingBookmarkNo) {
		int result = service.deleteCampingBookmark(campingBookmarkNo);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/updateCampingFrm.do")
	public String updateCampingFrm(int campingNo, Model model) {
		Camping c = service.updateCampingFrm(campingNo);
		model.addAttribute("camping",c);
		model.addAttribute("campingEtc",c.getCampingEtcList());
		model.addAttribute("campingService",c.getCampingProvideServiceList());
		model.addAttribute("campingRoomService",c.getCampingRoomServiceList());
		return "camping/updateCampingFrm";
	}
	
	@RequestMapping(value="/updateCamping")
	public String updateCamping(Camping c, String[] filepath, MultipartFile[] campingFilepath, HttpServletRequest requset, String[] campingService, String[] campingRoomService, String[] campingEtc,int campingNo, Model model) {
		if(campingService != null) {
			ArrayList<CampingProvideService> campingServicelist = new ArrayList<CampingProvideService>();
			for(String str : campingService) {
				CampingProvideService cps = new CampingProvideService();
				cps.setCampingService(str);
				campingServicelist.add(cps);
			}
			c.setCampingProvideServiceList(campingServicelist);
		}
		if(campingRoomService != null) {
			ArrayList<CampingRoomService> campingRoomServicelist = new ArrayList<CampingRoomService>();
			for(String str : campingRoomService) {
				CampingRoomService crs = new CampingRoomService();
				crs.setCampingRoomService(str);
				campingRoomServicelist.add(crs);
			}
			c.setCampingRoomServiceList(campingRoomServicelist);
		}
		if(campingEtc != null) {
			ArrayList<CampingEtc> campingEtclist = new ArrayList<CampingEtc>();
			for(String str : campingEtc) {
				CampingEtc ce = new CampingEtc();
				ce.setCampingEtc(str);
				campingEtclist.add(ce);
			}
			c.setCampingEtcList(campingEtclist);
		}
		if(!campingFilepath[0].isEmpty()) {
			String savePath = requset.getSession().getServletContext().getRealPath("/resources/upload/camping/");
			for(MultipartFile file : campingFilepath) {
				String filepath2 = manager.upload(savePath, file);
				c.setFilepath(filepath2);
			}
		}
		int result = service.updateCamping(c, campingNo);
		if(filepath != null && result > 0) {
			String savePath = requset.getSession().getServletContext().getRealPath("/resources/upload/camping/");
			for(String delFile : filepath) {
				manager.deleteFile(savePath, delFile);
			}
			model.addAttribute("title", "캠핑장 수정 성공");
			model.addAttribute("msg", "캠핑장 수정에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+c.getMemberId());
			return "common/modalAlert";
		}else if(filepath == null && result > 0){
			model.addAttribute("title", "캠핑장 수정 성공");
			model.addAttribute("msg", "캠핑장 수정에 성공하셨습니다.");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+c.getMemberId());
			return "common/modalAlert";
		}else {
			model.addAttribute("title", "캠핑장 수정 실패");
			model.addAttribute("msg", "캠핑장 수정에 실패하셨습니다. 다시 시도해주세요.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/sellList.do?reqPage=1&memberId="+c.getMemberId());
			return "common/modalAlert";
		}
	}
	
	@RequestMapping(value = "/reservationMyInfo.do")
	public String selectReservationMyInfo(Model model, int campingReservationNo) {
		reservationInfo ri = service.selectReservationMyInfo(campingReservationNo);
		model.addAttribute("campingAddr",ri.getCampingAddr());
		model.addAttribute("campingPaymentDate",ri.getCampingPaymentDate());
		model.addAttribute("campingTitle",ri.getCampingTitle());
		model.addAttribute("checkIn",ri.getCheckIn());
		model.addAttribute("checkOut",ri.getCheckOut());
		model.addAttribute("memberName",ri.getMemberName());
		model.addAttribute("memberPhone",ri.getMemberPhone());
		model.addAttribute("campingReservationNo",campingReservationNo);
		return "reservation/reservationMyInfo";
	}
	@RequestMapping(value = "/deleteCampingReservation.do")
	public String deleteCampingReservation(int campingReservationNo,int memberNo) {
		int result = service.deleteCampingReservation(campingReservationNo);
		return "redirect:/cmapingPayList.do?reqPage=1&memberNo="+memberNo;
	}
	@RequestMapping(value ="/campingReservationCheckFrm.do")
	public String campingReservationCheckFrm() {
		return "reservation/campingReservationCheckFrm";
	}
	@RequestMapping(value ="/campingReservationCheck.do")
	public String campingReservationCheck(Model model, String memberName, String memberPhone) {
		Member member = service.selectMember(memberName, memberPhone);
		if(member == null) {
			return "reservation/campingReservationCheck";			
		}
		ArrayList<CampingReservationCheck> list = service.selectReservationCheck(member.getMemberNo(),member.getMemberId());
		model.addAttribute("list",list);
		model.addAttribute("member",member);
		return "reservation/campingReservationCheck";
	}
}






















