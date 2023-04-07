package kr.or.iei.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.notice.model.dao.NoticeDao;
import kr.or.iei.notice.model.vo.Notice;
import kr.or.iei.notice.model.vo.NoticePageData;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao dao;

	public NoticePageData selectNoticeList(int reqPage) {
		int numPerPage = 10;
		int end = numPerPage * reqPage;
		int start = end - numPerPage + 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Notice> list = dao.selectNoticeList(map);

		int totalCount = dao.selectNoticeCount();
		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		// 네비게이션 사이즈
				int pageNaviSize = 5; // 기본값 5

				// 페이지 네비게이션 시작번호
				// reqPage 1 ~ 5 : 1 2 3 4 5
				// reqPAge 6 ~ 10 : 6 7 8 9 10

				// 시작값 구하기 1, 6, 11 ....
				int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

				// 페이지 네이게이션 제작 시작
				String pageNavi = "<ul class='pagination circle-style'>";
				// 이전버튼
				if (pageNo != 1) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/noticeList.do?reqPage=" + (pageNo - 1) + "'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				// 페이지 숫자
				for (int i = 0; i < pageNaviSize; i++) {
					if (pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/noticeList.do?reqPage=" + (pageNo) + "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					} else {
							pageNavi += "<li>";
							pageNavi += "<a class='page-item' href='/noticeList.do?reqPage=" + (pageNo) + "'>";
							pageNavi += pageNo;
							pageNavi += "</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				// 다음버튼
				if(pageNo <= totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/noticeList.do?reqPage=" + (pageNo) + "'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
		NoticePageData npd = new NoticePageData(list, pageNavi);
		return npd;
	}

	public int insertNoitce(Notice n) {
		return dao.insertNotice(n);
	}

	public Notice selectOneNotice(int noticeNo) {
		return dao.selectOneNotice(noticeNo);
	}

	public int updateNotice(Notice n) {
		return dao.updateNotice(n);
	}

	public int deleteNotice(int noticeNo) {
		return dao.deleteNotice(noticeNo);
	}
}
