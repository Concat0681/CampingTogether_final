package kr.or.iei.blacklist.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.blacklist.model.dao.BlacklistDao;
import kr.or.iei.blacklist.model.vo.Blacklist;
import kr.or.iei.blacklist.model.vo.BlacklistPageData;
import kr.or.iei.blacklist.model.vo.BlacklistPhoto;
import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardPageData;

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


	public BlacklistPageData selectBlacklistList(int reqPage) {
		int numPerPage = 9;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Blacklist> list = dao.selectAllBlacklist(map);
		int totalCount = dao.selectBlacklistCount();
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 10;
		
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/blackMemberList.do?reqPage="+(pageNo-1)+"'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
			for(int i=0; i<pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li><a class='page-item active-page'>"+pageNo+"</a></li>";
				}else {
					pageNavi += "<li><a class='page-item' href='/blackMemberList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
		if(pageNo <= totalPage) {
			pageNavi += "<li><a class='page-item' href='/blackMemberList.do?reqPage="+(pageNo+1)+"'><span class='material-symbols-outlined'>chevron_right </span></a></li>";
		}
		
		BlacklistPageData blpd = new BlacklistPageData(list, pageNavi);
		return blpd;
	}


	public Blacklist selectOneBlacklist(int blacklistNo) {
		//1.게시글정보
		Blacklist bl = dao.selectOneBlacklist(blacklistNo);
		//2.첨부파일
		ArrayList<BlacklistPhoto> list = dao.selectOneBlacklistPhoto(blacklistNo);
		bl.setPhotolist(list);
		return bl;
	}

	@Transactional
	public int updateBlacklistStatus(Blacklist bl) {
		//1. 블랙리스트 업데이트
		int result = dao.updateBlacklistStatus(bl);
		//2. 블랙리스트 COUNT SELECT
		int blackCount = dao.selectMemberBlackCount(bl.getBlacklistMemberId());
		//3. 멤버업데이트
		if(blackCount >= 3) {
			result = dao.updateBlackMember(bl.getBlacklistMemberId());
		}
		return result;
	}


	public BlacklistPhoto getPhoto(int blacklistPhotoNo) {
		return dao.getPhoto(blacklistPhotoNo);
	}


	public ArrayList<Blacklist> selectSearchBlackMember(String blacklistMemberId) {
		return dao.selectSearchBlackMember(blacklistMemberId);
	}
}







