package kr.or.iei.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.camping.model.service.CampingService;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvide;

@Controller
public class CampingController {

	@Autowired
	private CampingService service;
	
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
	
	@RequestMapping(value="/detailSearchCamping.do")
	public String detailSearchCamping(String[] campingType, CampingProvide campingProvide) {
		int reqPage = 1;
		String order = "avgReviewRating";
		System.out.println(campingProvide);
		System.out.println(campingType.length);
		CampingListPageData cpd = service.selectCampingListData(reqPage, order);
		return "redirect:/";
	}
}
