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
import kr.or.iei.camping.model.vo.CampingEtc;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvideService;
import kr.or.iei.camping.model.vo.CampingReview;
import kr.or.iei.camping.model.vo.CampingReviewFileVO;
import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.camping.model.vo.ViewCampingData;
import kr.or.iei.camping.model.vo.CampingRoomFileVO;
import kr.or.iei.camping.model.vo.CampingRoomService;

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
	public String campingListMain() {
		return "camping/campingListMain";
	}
	
	@RequestMapping(value="/campingList.do")
	public String campingList(String cityNameKR, String cityNameEN,int reqPage, String order, String pplCount, String checkIn, String checkOut, Model model) {
		CampingRoom campingRoom = new CampingRoom();
		Camping camping = new Camping();
		camping.setCampingAddr(cityNameKR);
		campingRoom.setCampingRoomMaxPplCount(Integer.parseInt(pplCount));
		CampingListPageData cpd = service.selectCampingListData(reqPage, order, camping, campingRoom);
		model.addAttribute("cityNameKR", cityNameKR);
		model.addAttribute("cityNameEN", cityNameEN);
		model.addAttribute("list", cpd.getList()); 
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("allList", cpd.getAllList());
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("pplCount", pplCount);
		return "camping/campingList";
	}
	
	@ResponseBody
	@RequestMapping(value="/detailSearchCamping.do", produces="application/json;charset=utf-8")
	public String detailSearchCamping(String order, String campingTypeStr, String campingServiceStr, String campingRoomServiceStr, String campingEtcStr, String pplCount, String cityAddr, int reqPage) {
		if(reqPage == 0) {
			reqPage = 1;
		}
		CampingRoom campingRoom = new CampingRoom();
		if(campingTypeStr != "") {
			String[] campingType = campingTypeStr.split(",");
			ArrayList<String> arr1 = new ArrayList<String>();
			for(String str : campingType) {
				arr1.add(str);
			}
			campingRoom.setCampingRoomTypeList(arr1);
		}
		Camping camping = campingProvideSetter(campingServiceStr, campingRoomServiceStr, campingEtcStr);
		camping.setCampingAddr(cityAddr);
		campingRoom.setCampingRoomMaxPplCount(Integer.parseInt(pplCount));
		CampingListPageData cpd = service.selectCampingListData(reqPage, order, camping, campingRoom);
		return new Gson().toJson(cpd);
	}
	
	@RequestMapping(value="/campingWrite.do")
	public String campingWrite(Camping c, MultipartFile[] campingFilepath, HttpServletRequest requset, String[] campingService, String[] campingRoomService, String[] campingEtc, CampingRoom cr, MultipartFile[] campingRoomFilepath) {
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
			return "redirect:/";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/campingRoomWriteFrm.do")
	public String campingRoomWriteFrm(HttpServletRequest request, Model model) {
		int campingNo = Integer.parseInt(request.getParameter("campingNo"));
		model.addAttribute("campingNo",campingNo);
		System.out.println(campingNo);
		return "camping/campingRoomWriteFrm";
	}
	
	@RequestMapping(value="/viewCamping.do")
	public String viewCamping(int campingNo, Model model) {
		ViewCampingData vcd = service.selectOneCamping(campingNo);
		model.addAttribute("camping" , vcd.getCamping());
		model.addAttribute("campingRoomList", vcd.getCampingRoomList());
		return "camping/viewCamping";
	}
	
	private Camping campingProvideSetter(String campingServiceStr, String campingRoomServiceStr, String campingEtcStr) {
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
	
	/*
	@RequestMapping(value="/campingRoomWrite.do")
	public String campingRoomWrite(CampingRoom cr, MultipartFile[] campingRoomFilepath, HttpServletRequest request) {
		ArrayList<CampingRoomFileVO> fileList = new ArrayList<CampingRoomFileVO>();
		if(!campingRoomFilepath[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/campingRoom");
			for(MultipartFile file : campingRoomFilepath) {
				String filepath = manager.upload(savePath, file);
				CampingRoomFileVO campingRoomFileVO = new CampingRoomFileVO();
				campingRoomFileVO.setFilepath(filepath);
				fileList.add(campingRoomFileVO);
			}
		}
		int result = service.insertCampingRoom(cr, fileList);
		if(result == (fileList.size()+1)) {
			return "redirect:/";
		}else {
			return "redirect:/";
		}
	}
	*/
	
	@RequestMapping(value="/campingReview.do")
	public String campingReview() {
		return "campingReview/campingReview";
	}
	
	@RequestMapping(value="/campingReviewWrite.do")
	public String campingReviewWrite(CampingReview crv, MultipartFile[] campingReviewFilepath, HttpServletRequest request, int campingNo) {
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
			return "redirect:/viewCamping.do?campingNo="+campingNo;
		}else {
			return "redirect:/";
		}
	}
}






















