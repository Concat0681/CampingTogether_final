package kr.or.iei.board.food.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.board.food.model.dao.BoardFoodDao;
import kr.or.iei.board.food.model.vo.BoardFood;
import kr.or.iei.board.food.model.vo.BoardFoodPageData;
import kr.or.iei.notice.model.vo.NoticePageData;

@Service
public class BoardFoodService {

	@Autowired
	private BoardFoodDao dao;

	public BoardFoodPageData selectFoodList(int reqPage) {
		int numPerPage = 12;
		int end = numPerPage * reqPage;
		int start = end - numPerPage +1 ;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<BoardFood> list = dao.selectFoodList(map);
		
		int totalCount = dao.selectFoodCount();
		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		// �׺���̼� ������
				int pageNaviSize = 5; // �⺻�� 5

				// ������ �׺���̼� ���۹�ȣ
				// reqPage 1 ~ 5 : 1 2 3 4 5
				// reqPAge 6 ~ 10 : 6 7 8 9 10

				// ���۰� ���ϱ� 1, 6, 11 ....
				int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

				// ������ ���̰��̼� ���� ����
				String pageNavi = "<ul class='pagination circle-style'>";
				// ������ư
				if (pageNo != 1) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/boarFoodList.do?reqPage=" + (pageNo - 1) + "'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				// ������ ����
				for (int i = 0; i < pageNaviSize; i++) {
					if (pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/boarFoodList.do?reqPage=" + (pageNo) + "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					} else {
							pageNavi += "<li>";
							pageNavi += "<a class='page-item' href='/boarFoodList.do?reqPage=" + (pageNo) + "'>";
							pageNavi += pageNo;
							pageNavi += "</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				// ������ư
				if(pageNo <= totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/boarFoodList.do?reqPage=" + (pageNo) + "'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
		BoardFoodPageData bfpd = new BoardFoodPageData(list, pageNavi);
		return bfpd;
	}
}
