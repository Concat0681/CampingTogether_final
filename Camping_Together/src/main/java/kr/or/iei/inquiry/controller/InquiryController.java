package kr.or.iei.inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.inquiry.model.service.InquiryService;
import kr.or.iei.inquiry.model.vo.InquiryPageData;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService service;
	
	@RequestMapping(value = "/InquiryList.do")
	public String inquiryList(int reqPage, Model model) {
		InquiryPageData ipd = service.selectInquiryList(reqPage);
		System.out.println(model);
		model.addAttribute("list",ipd.getList());
		model.addAttribute("pageNavi", ipd.getPageNavi());
		return "inquiry/inquiryList";
		
	}
}
