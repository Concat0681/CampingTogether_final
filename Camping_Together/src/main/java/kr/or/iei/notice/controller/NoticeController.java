package kr.or.iei.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.notice.model.service.NoticeService;
import kr.or.iei.notice.model.vo.Notice;
import kr.or.iei.notice.model.vo.NoticePageData;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "/noticeList.do")
	public String noticeList(int reqPage, Model model) {
		NoticePageData npd = service.selectNoticeList(reqPage);
		model.addAttribute("list", npd.getList());
		model.addAttribute("pageNavi",npd.getPageNavi());
		return "notice/noticeList";
	}
	@RequestMapping(value="/noticeWriteFrm.do")
	public String noticeWriteFrm() {
		return "notice/noticeWriteFrm";
	}
	@RequestMapping(value="/noticeWrite.do")
	public String noticeWrite(Notice n) {
		int result = service.insertNoitce(n);
		System.out.println(n);
		if(result>0) {
			return "redirect:/noticeList.do?reqPage=1";
		}else {
			return "redirect:/noticeWriterFrm.do";
		}
	}
	@RequestMapping(value="/noticeView.do")
	public String noticeView(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		if(n !=null) {
			model.addAttribute("n", n);
			return "notice/noticeView";
		}else {
			return "redirect/noticeList.do";
		}
	}
	@RequestMapping(value="/noticeUpdateFrm.do")
	public String noticeUpdateFrm(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		if(n !=null) {
			model.addAttribute("n",n);
			return "notice/noticeUpdateFrm";
		}else {
			return "notice/noticeList.do";
		}
	}
	@RequestMapping(value="/noticeUpdate.do")
	public String noticeUpdate(Notice n) {
		int result = service.updateNotice(n);
		if(result>0) {
			return "redirect:/noticeView.do?noticeNo="+n.getNoticeNo();
		}else {
			return "redirect:/noticeList.do";
		}
	}
	@RequestMapping(value="/noticeDelete.do")
	public String noticeDelete(int noticeNo) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			return "redirect:/noticeList.do?reqPage=1";
		}else {
			return "redirect:/noticeView.do?noticeNo="+noticeNo;
		}
	}
}
