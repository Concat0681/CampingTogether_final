package kr.or.iei.usedBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.usedBoard.model.dao.UsedBoardDao;
import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardPageDate;
import kr.or.iei.usedBoard.model.vo.UsedBoardPhoto;

@Service
public class UsedBoardService {

	@Autowired
	private UsedBoardDao dao;
	
	public UsedBoardPageDate selectUsedBoardList(int reqPage) {
		int numPerPage = 9;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<UsedBoard> list = dao.selectUsedBoardList(map);
		System.out.println(list.get(0).getThumbnail());
		int totalCount = dao.selectBoardCount();
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 10;
		
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a class='page-item' href='/usedBoardList.do?reqPage="+(pageNo-1)+"'><span class='material-icons'>chevron_left</span></a>";
		}
			for(int i=0; i<pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<a class='page-item active-page'>"+pageNo+"</a>";
				}else {
					pageNavi += "<a class='page-item' href='/usedBoardList.do>reqPage="+pageNo+"'>"+pageNo+"</a>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='page-item' href='/usedBoardList.do?reqPage="+(pageNo+1)+"'><span class='material-icons'>chevron_right </span></a>";
		}
		UsedBoardPageDate ubpd = new UsedBoardPageDate(list, pageNavi);
		return ubpd;
	}

	public int insertUsedBoard(UsedBoard ub, ArrayList<UsedBoardPhoto> photoList) {
		//1.board insert, 2. boardNo Á¶È¸, 3. photo insert
		int result = dao.insertUsedBoard(ub);
		if(result > 0) {
			for(UsedBoardPhoto photo : photoList) {
				photo.setUsedBoardNo(ub.getUsedBoardNo());
				result += dao.insertUsedPhoto(photo);
			}
		}
		return result;
	}
}
