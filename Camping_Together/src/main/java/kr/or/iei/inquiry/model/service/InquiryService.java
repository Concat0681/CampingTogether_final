package kr.or.iei.inquiry.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.inquiry.model.dao.InquiryDao;
import kr.or.iei.inquiry.model.vo.AdminInquiry;
import kr.or.iei.inquiry.model.vo.Inquiry;
import kr.or.iei.inquiry.model.vo.InquiryPageData;

@Service
public class InquiryService {

	@Autowired
	private InquiryDao dao;

	public InquiryPageData selectInquiryList(int reqPage) {
		int numPerPage = 10;
		int end = numPerPage * reqPage;
		int start = end - numPerPage +1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end); 
		ArrayList<Inquiry> list = dao.selectInquiry(map);
		
		int totalCount = dao.selectInquiryCount();
		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination circle-style'>";
		if (pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/inquiryList.do?reqPage=" + (pageNo - 1) + "'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/inquiryList.do?reqPage=" + (pageNo) + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/inquiryList.do?reqPage=" + (pageNo) + "'>";
					pageNavi += pageNo;
					pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/inquiryList.do?reqPage=" + (pageNo) + "'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
			InquiryPageData ipd = new InquiryPageData(list, pageNavi);
			return ipd;
	}

	public int insertInquiry(Inquiry iq) {
		return dao.insertInquiry(iq);
	}

	public int updateInquiry(Inquiry iq) {
		return dao.updateInquiry(iq);
	}

	public int deleteInquiry(int inquiryNo) {
		return dao.deleteInquiry(inquiryNo);
	}

	public int insertAdminInquiry(AdminInquiry ai, int inquiryNo) {
		int result = dao.insertAdminInquiry(ai);
			if(result>0) {
				dao.updateInquiryStatus(inquiryNo);
			}
		return result;
	}

	public ArrayList<AdminInquiry> selectAdminInquiryList(AdminInquiry ai) {
		ArrayList<AdminInquiry> list = dao.selectAdminInquiryList(ai);
		return list;
	}

	public AdminInquiry selectAllAdminInquiry(int inquiryNo) {
		return dao.selectAllAdminInquiry(inquiryNo);
	}
}
