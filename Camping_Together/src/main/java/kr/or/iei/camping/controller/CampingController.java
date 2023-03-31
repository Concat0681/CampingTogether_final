package kr.or.iei.camping.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.Gson;
import com.google.gson.JsonElement;

import common.FileManager;
import kr.or.iei.camping.model.service.CampingService;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvide;

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
	public String campingList(String cityNameKR, String cityNameEN,int reqPage, String order, Model model) {
		CampingListPageData cpd = service.selectCampingListData(reqPage, order);
		model.addAttribute("cityNameKR", cityNameKR);
		model.addAttribute("cityNameEN", cityNameEN);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		return "camping/campingList";
	}
	
	@ResponseBody
	@RequestMapping(value="/campingListOrder.do", produces="application/json;charset=utf-8")
	public String campingListOrder(String order) {
		int reqPage = 1;
		CampingListPageData cpd = service.selectCampingListData(reqPage, order);
		return new Gson().toJson(cpd);
	}
	
	@ResponseBody
	@RequestMapping(value="/detailSearchCamping.do", produces="application/json;charset=utf-8")
	public String detailSearchCamping(String campingTypeStr, String campingServiceStr, String campingRoomServiceStr, String campingEtcStr) {
		int reqPage = 1;
		String order = "avgReviewRating";
		String[] campingType = campingTypeStr.split(",");
		String[] campingService = campingServiceStr.split(",");
		String[] campingRoomService = campingRoomServiceStr.split(",");
		String[] campingEtc = campingEtcStr.split(",");
		CampingProvide campingProvide = new CampingProvide();
		ArrayList<String> arr1 = new ArrayList<String>();
		ArrayList<String> arr2 = new ArrayList<String>();
		ArrayList<String> arr3 = new ArrayList<String>();
		ArrayList<String> arr4 = new ArrayList<String>();
		Collections.addAll(arr1, campingType);
		Collections.addAll(arr2, campingService);
		Collections.addAll(arr3, campingRoomService);
		Collections.addAll(arr4, campingEtc);
		campingProvide.setCampingService(arr2);
		campingProvide.setCampingRoomService(arr3);
		campingProvide.setCampingEtc(arr4);
		CampingListPageData cpd = service.selectCampingListData(reqPage, order, campingProvide, campingType);
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
			return "redirect:/campingWriteFrm.do";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/campingRoomWriteFrm.do")
	public String campingRoomWriteFrm() {
		return "camping/campingRoomWriteFrm";
	}
}
