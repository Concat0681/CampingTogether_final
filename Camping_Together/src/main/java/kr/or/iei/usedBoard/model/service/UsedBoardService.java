package kr.or.iei.usedBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.usedBoard.model.dao.UsedBoardDao;
import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardComment;
import kr.or.iei.usedBoard.model.vo.UsedBoardPageData;
import kr.or.iei.usedBoard.model.vo.UsedBoardPhoto;
import kr.or.iei.usedBoard.model.vo.UsedWishList;

@Service
public class UsedBoardService {

	@Autowired
	private UsedBoardDao dao;
	
	public UsedBoardPageData selectUsedBoardList(int reqPage, String memberId, String usedBoardWriter) {
		int numPerPage = 9;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		map.put("usedBoardWriter", usedBoardWriter);
		ArrayList<UsedBoard> list = dao.selectUsedBoardList(map);
		int totalCount = dao.selectBoardCount(usedBoardWriter);
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		String url = "/usedBoardList.do?reqPage=";
		String endUrl = "";
		if(usedBoardWriter != null) {
			url = "myUsedSellList.do?reqPage=";
			endUrl = "&memberId="+usedBoardWriter;
		}
		if(memberId != null) {
			endUrl = "&memberId="+memberId;
		}
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='"+url+(pageNo-1)+endUrl+"'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
			for(int i=0; i<pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li><a class='page-item active-page'>"+pageNo+"</a></li>";
				}else {
					pageNavi += "<li><a class='page-item' href='"+url+pageNo+endUrl+"'>"+pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
		if(pageNo <= totalPage) {
			pageNavi += "<li><a class='page-item' href='"+url+(pageNo+1)+endUrl+"'><span class='material-symbols-outlined'>chevron_right </span></a></li>";
		}
		UsedBoardPageData ubpd = new UsedBoardPageData();
		ubpd.setList(list);
		ubpd.setPageNavi(pageNavi);
		ubpd.setTotalCount(totalCount);
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

	public UsedBoard selectOneUsedBoard(int usedBoardNo, String memberId) {
		//1.조회수
		int result = dao.updateReadCount(usedBoardNo);
		//2.게시글정보
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("usedBoardNo", usedBoardNo);
 		UsedBoard ub = dao.selectOneUsedBoard(map);
		//3.게시글 첨부사진
		ArrayList<UsedBoardPhoto> list = dao.selectUsedPhoto(usedBoardNo);
		ub.setUsedBoardPhotoList(list);
		return ub;
	}
	
	public UsedBoard selectUpdateUsedBoard(int usedBoardNo) {
		//1.게시글정보
		UsedBoard ub = dao.selectUpdateUsedBoard(usedBoardNo);
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
	
	@Transactional
	public int updateUsedBoard(UsedBoard ub, ArrayList<UsedBoardPhoto> filelist, int[] fileNo) {
		//1. 보드테이블 수정
		int result = dao.updateUsedBoard(ub);
		if(result > 0) {
			//2. 기존첨부파일삭제 : fileNo 가 null이 아닐경우 삭제할 파일이 존재
			if(fileNo != null) {
				for(int no : fileNo) {
					result += dao.deleteFile(no);
				}
			}
			//3. 새로운 첨부파일이 존재할 경우 추가
			for(UsedBoardPhoto ubp : filelist) {
				ubp.setUsedBoardNo(ub.getUsedBoardNo());
				result += dao.insertUsedPhoto(ubp);
			}
		}
		return result;
	}
	@Transactional
	public int updateUsedBoardStatus(int usedBoardNo) {
		return dao.updateUsedBoardStatus(usedBoardNo);
	}

	public ArrayList<UsedBoard> getTop3UsedBoards(UsedBoard ub) {
		return dao.getTop3UsedBoards(ub);

	}

	public int insertUsedWishList(UsedWishList uwl) {
		return dao.insertUsedWishList(uwl);
	}

	public int deleteUsedWishList(UsedWishList uwl) {
		return dao.deleteUsedWishList(uwl);
	}

	public ArrayList<UsedBoard> selectAllWishBoard(String memberId) {
		return dao.selectAllWishBoard(memberId);
	}

}




