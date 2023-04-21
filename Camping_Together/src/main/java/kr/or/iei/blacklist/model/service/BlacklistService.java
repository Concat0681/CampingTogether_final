package kr.or.iei.blacklist.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.blacklist.model.dao.BlacklistDao;
import kr.or.iei.blacklist.model.vo.Blacklist;
import kr.or.iei.blacklist.model.vo.BlacklistPhoto;
import kr.or.iei.usedBoard.model.vo.UsedBoard;

@Service
public class BlacklistService {
	@Autowired
	private BlacklistDao dao;
	

	public UsedBoard selectBlackUsedBoard(int usedBoardNo) {
		return dao.selectBlackUsedBoard(usedBoardNo);
	}


	public int insertBlacklist(Blacklist bl, ArrayList<BlacklistPhoto> photoList) {
		int result = dao.insertBlacklist(bl);
		if(result > 0) {
			for(BlacklistPhoto photo : photoList) {
				photo.setBlacklistNo(bl.getBlacklistNo());
				result += dao.insertBlacklistPhoto(photo);
			}
		}
		return result;
	}

	public ArrayList<Blacklist> selectBlacklistMyHistory(String memberId) {
		return dao.selectBlacklistMyHistory(memberId);
	}
}
