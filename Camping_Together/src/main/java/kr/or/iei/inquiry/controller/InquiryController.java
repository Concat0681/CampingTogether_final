package kr.or.iei.inquiry.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.inquiry.model.service.InquiryService;
import kr.or.iei.inquiry.model.vo.AdminInquiry;
import kr.or.iei.inquiry.model.vo.Inquiry;
import kr.or.iei.inquiry.model.vo.InquiryPageData;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService service;
	
	@RequestMapping(value = "/inquiryList.do")
	public String inquiryList(int reqPage, Model model, AdminInquiry ai) {
		InquiryPageData ipd = service.selectInquiryList(reqPage);
		
		model.addAttribute("list",ipd.getList());
		model.addAttribute("pageNavi", ipd.getPageNavi());
		return "inquiry/inquiryList";
		
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/insertInquriry.do",  produces = "application/json;charset=utf-8")
	public int insertInquiry(Inquiry iq) {
		int result = service.insertInquiry(iq);
		if(result>0) {
			//성공
			return 1;
		}else {
			return 0;
		}
	}
	@ResponseBody
	@RequestMapping(value  = "/updateInquiry.do", produces = "application/json;charset=utf-8" )
	public int updateInquiry(Inquiry iq) {
		int result = service.updateInquiry(iq);
		System.out.println(result);
		if(result>0) {
			return 1;
		}else {
			return 0;
		}
	}
	@RequestMapping(value = "/deleteInquiry.do")
	public String deleteInquiry(int inquiryNo) {
		int result = service.deleteInquiry(inquiryNo);
		return "redirect:/inquiryList.do?reqPage=1";
	}
	@ResponseBody
	@RequestMapping(value="/insertAdminInquiry.do", produces = "application/json;charset=utf-8")
	public int insertAdminInquiry(AdminInquiry ai, int inquiryNo) {
		int result = service.insertAdminInquiry(ai,inquiryNo);
		if(result>0){
			return 1;
		}else {
			return 0;
		}
	}
	@ResponseBody
	@RequestMapping(value = "/selectAdminInquiry.do", produces = "application/json;charset=utf-8")
	public AdminInquiry selectAdminInquiry(int inquiryNo) {
		AdminInquiry ai = service.selectAllAdminInquiry(inquiryNo);
		return ai;
	}
}

