package kr.or.iei.camping.controller;

import java.util.ArrayList;
import java.util.Collections;

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
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvide;
import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.camping.model.vo.ViewCampingData;

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
	public String campingList(String cityNameKR, String cityNameEN,int reqPage, String order, String pplCount, String checkIn, String checkOut, String date, Model model) {
		CampingRoom campingRoom = new CampingRoom();
		CampingProvide campingProvide = new CampingProvide();
		campingRoom.setCampingRoomMaxPplCount(Integer.parseInt(pplCount));
		CampingListPageData cpd = service.selectCampingListData(reqPage, order, campingProvide, campingRoom);
		model.addAttribute("cityNameKR", cityNameKR);
		model.addAttribute("cityNameEN", cityNameEN);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("pplCount", pplCount);
		model.addAttribute("date", date);
		return "camping/campingList";
	}
	
	@ResponseBody
	@RequestMapping(value="/detailSearchCamping.do", produces="application/json;charset=utf-8")
	public String detailSearchCamping(String order, String campingTypeStr, String campingServiceStr, String campingRoomServiceStr, String campingEtcStr, String pplCount) {
		int reqPage = 1;
		CampingRoom campingRoom = new CampingRoom();
		if(campingTypeStr != "") {
			String[] campingType = campingTypeStr.split(",");
			ArrayList<String> arr1 = new ArrayList<String>();
			Collections.addAll(arr1, campingType);
			campingRoom.setCampingRoomType(arr1);
		}
		CampingProvide campingProvide = campingProvideSetter(campingServiceStr, campingRoomServiceStr, campingEtcStr);
		campingRoom.setCampingRoomMaxPplCount(Integer.parseInt(pplCount));
		CampingListPageData cpd = service.selectCampingListData(reqPage, order, campingProvide, campingRoom);
		return new Gson().toJson(cpd);
	}
	
	@RequestMapping(value="/campingWrite.do")
	public String campingWrite(Camping c, MultipartFile[] campingFilepath, HttpServletRequest requset) {
		Camping fileList = new Camping();
		if(!campingFilepath[0].isEmpty()) {
			String savePath = requset.getSession().getServletContext().getRealPath("/resources/upload/camping");
			for(MultipartFile file : campingFilepath) {
				String filename = file.getOriginalFilename();
				String filepath = manager.upload(savePath, file);
				c.setFilepath(filepath);
			}
		}
		int result = service.insertCamping(c);
		if(result > 0) {
			return "redirect:campingRoomWriteFrm.do";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/campingRoomWriteFrm.do")
	public String campingRoomWriteFrm() {
		return "camping/campingRoomWriteFrm";
	}
	
	@RequestMapping(value="/viewCamping.do")
	public String viewCamping(int campingNo, Model model) {
		ViewCampingData vcd = service.selectOneCamping(campingNo);
		model.addAttribute("camping" , vcd.getCamping());
		model.addAttribute("campingRoomList", vcd.getCampingRoomList());
		model.addAttribute("campingProvideList", vcd.getCampingProvideList());
		return "camping/viewCamping";
	}
	
	private CampingProvide campingProvideSetter(String campingServiceStr, String campingRoomServiceStr, String campingEtcStr) {
		CampingProvide campingProvide = new CampingProvide();
		if(campingServiceStr != "") {
			String[] campingService = campingServiceStr.split(",");
			ArrayList<String> arr1 = new ArrayList<String>();
			Collections.addAll(arr1, campingService);
			campingProvide.setCampingService(arr1);
		}
		if(campingRoomServiceStr != "") {
			String[] campingRoomService = campingRoomServiceStr.split(",");
			ArrayList<String> arr2 = new ArrayList<String>();
			Collections.addAll(arr2, campingRoomService);
			campingProvide.setCampingRoomService(arr2);
		}
		if(campingRoomServiceStr != "") {
			String[] campingEtc = campingEtcStr.split(",");
			ArrayList<String> arr3 = new ArrayList<String>();
			Collections.addAll(arr3, campingEtc);
			campingProvide.setCampingEtc(arr3);
		}
		return campingProvide;
	}
}
