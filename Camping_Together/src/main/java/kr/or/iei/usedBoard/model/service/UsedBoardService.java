package kr.or.iei.usedBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.usedBoard.model.dao.UsedBoardDao;
import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardComment;
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
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 10;
		
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/usedBoardList.do?reqPage="+(pageNo-1)+"'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
			for(int i=0; i<pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li><a class='page-item active-page'>"+pageNo+"</a></li>";
				}else {
					pageNavi += "<li><a class='page-item' href='/usedBoardList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
		if(pageNo <= totalPage) {
			pageNavi += "<li><a class='page-item' href='/usedBoardList.do?reqPage="+(pageNo+1)+"'><span class='material-symbols-outlined'>chevron_right </span></a></li>";
		}
		UsedBoardPageDate ubpd = new UsedBoardPageDate(list, pageNavi);
		return ubpd;
	}
	
	@Transactional
	public int insertUsedBoard(UsedBoard ub, ArrayList<UsedBoardPhoto> photoList) {
		//1.board insert, 2. boardNo ��ȸ, 3. photo insert
		int result = dao.insertUsedBoard(ub);
		if(result > 0) {
			for(UsedBoardPhoto photo : photoList) {
				photo.setUsedBoardNo(ub.getUsedBoardNo());
				result += dao.insertUsedPhoto(photo);
			}
		}
		return result;
	}

	public UsedBoard selectOneUsedBoard(int usedBoardNo) {
		//1.조회수
		int result = dao.updateReadCount(usedBoardNo);
		//2.게시글정보
		UsedBoard ub = dao.selectOneUsedBoard(usedBoardNo);
		//3.게시글 첨부사진
		ArrayList<UsedBoardPhoto> list = dao.selectUsedPhoto(usedBoardNo);
		ub.setUsedBoardPhotoList(list);
		return ub;
	}
	
	public UsedBoard selectUpdateUsedBoard(int usedBoardNo) {
		//1.게시글정보
		UsedBoard ub = dao.selectOneUsedBoard(usedBoardNo);
		//2.게시글 첨부사진
		ArrayList<UsedBoardPhoto> list = dao.selectUsedPhoto(usedBoardNo);
		ub.setUsedBoardPhotoList(list);
		return ub;
	}

	@Transactional
	public int usedBoardCommentInsert(UsedBoardComment ubc) {
		return dao.usedBoardCommentInsert(ubc);
	}

	public ArrayList<UsedBoardComment> selectCommentList(int usedBoardNo) {
		return dao.selectCommentList(usedBoardNo);
	}

	public int commentCount(int usedBoardNo) {
		return dao.commentCount(usedBoardNo);
	}

	@Transactional
	public int updateUsedBoardComment(UsedBoardComment ubc) {
		return dao.updateUsedBoardComment(ubc);
	}
	
	@Transactional
	public int deleteUsedBoardComment(int usedBoardCommentNo) {
		return dao.deleteUsedBoardComment(usedBoardCommentNo);
	}

	public UsedBoard sellUserCheck(String usedBoardWriter) {
		return dao.sellUserCheck(usedBoardWriter);
	}

	public int sellerBlackCount(String usedBoardWriter) {
		return dao.sellerBlackCount(usedBoardWriter);
	}

	@Transactional
	public ArrayList<UsedBoardPhoto> deleteUsedBoard(int usedBoardNo) {
		ArrayList<UsedBoardPhoto> photoList = dao.selectUsedPhoto(usedBoardNo);
		int result = dao.deleteUsedBoard(usedBoardNo);
		if(result > 0) {
			return photoList;
		}else {
			return null;			
		}
	}
}




