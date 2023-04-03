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
		int totalCount = dao.selectBoardCount();
		return null;
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
