package kr.or.iei.usedBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.blacklist.model.vo.Blacklist;
import kr.or.iei.blacklist.model.vo.BlacklistPhoto;
import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardComment;
import kr.or.iei.usedBoard.model.vo.UsedBoardPhoto;
import kr.or.iei.usedBoard.model.vo.UsedWishList;

@Repository
public class UsedBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;


	public int insertUsedBoard(UsedBoard ub) {
		int result = sqlSession.insert("usedBoard.insertUesdBoard", ub);
		return result;
	}

	public int insertUsedPhoto(UsedBoardPhoto photo) {
		int result = sqlSession.insert("usedBoard.insertUesdPhoto", photo);
		return result;
	}

	public ArrayList<UsedBoard> selectUsedBoardList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("usedBoard.selectUsedBoardList", map);
		return (ArrayList<UsedBoard>)list;
	}

	public int selectBoardCount(String usedBoardWriter) {
		int totalCount = sqlSession.selectOne("usedBoard.totalCount", usedBoardWriter); 
		return totalCount;
	}

	public int updateReadCount(int usedBoardNo) {
		int result = sqlSession.update("usedBoard.updateReadCount", usedBoardNo);
		return result;
	}

	public UsedBoard selectOneUsedBoard(HashMap<String, Object> map) {
		UsedBoard ub = sqlSession.selectOne("usedBoard.selectOneUsedBoard", map);
		return ub;
	}

	public ArrayList<UsedBoardPhoto> selectUsedPhoto(int usedBoardNo) {
		List list = sqlSession.selectList("usedBoard.selectUsedPhoto", usedBoardNo);
		return (ArrayList<UsedBoardPhoto>)list;
	}

	public int usedBoardCommentInsert(UsedBoardComment ubc) {
		int result = sqlSession.insert("usedBoard.insertUsedBoardComment", ubc);
		return result;
	}

	public ArrayList<UsedBoardComment> selectCommentList(int usedBoardNo) {
		List list = sqlSession.selectList("usedBoard.selectCommentList", usedBoardNo);
		return (ArrayList<UsedBoardComment>)list;
	}

	public int commentCount(int usedBoardNo) {
		int commentCount = sqlSession.selectOne("usedBoard.commentCount", usedBoardNo);
		return commentCount;
	}

	public int updateUsedBoardComment(UsedBoardComment ubc) {
		int result = sqlSession.update("usedBoard.updateUsedBoardComment", ubc);
		return result;
	}

	public int deleteUsedBoardComment(int usedBoardCommentNo) {
		int result = sqlSession.delete("usedBoard.deleteUsedBoardComment", usedBoardCommentNo);
		return result;
	}

	public UsedBoard sellUserCheck(String usedBoardWriter) {
		UsedBoard ub = sqlSession.selectOne("usedBoard.sellUserCheck", usedBoardWriter);
		return ub;
	}

	public int sellerBlackCount(String usedBoardWriter) {
		int blackCount = sqlSession.selectOne("usedBoard.sellerBlackCount", usedBoardWriter);
		return blackCount;
	}

	public int deleteUsedBoard(int usedBoardNo) {
		int result = sqlSession.delete("usedBoard.deleteUsedBoard", usedBoardNo);
		return result;
	}

	public int updateUsedBoard(UsedBoard ub) {
		int result = sqlSession.update("usedBoard.updateUsedBoard", ub);
		return result;
	}

	public int deleteFile(int no) {
		int result = sqlSession.delete("usedBoard.deleteFile", no);
		return result;
	}

	public ArrayList<UsedBoard> getTop3UsedBoards(UsedBoard ub) {
		List list = sqlSession.selectList("usedBoard.getTop3UsedBoards", ub);
		return (ArrayList<UsedBoard>) list;

	}
	public int updateUsedBoardStatus(int usedBoardNo) {
		int result = sqlSession.update("usedBoard.updateUsedBoardStatus", usedBoardNo);
		return result;
	}

	public int insertUsedWishList(UsedWishList uwl) {
		int result = sqlSession.insert("usedBoard.insertUsedWishList", uwl);
		return result;
	}

	public int deleteUsedWishList(UsedWishList uwl) {
		int result = sqlSession.delete("usedBoard.deleteUsedWishList", uwl);
		return result;
	}

	public ArrayList<UsedBoard> selectAllWishBoard(String memberId) {
		List list = sqlSession.selectList("usedBoard.selectAllWishBoard", memberId);
		return (ArrayList<UsedBoard>)list;
	}

	public UsedBoard selectUpdateUsedBoard(int usedBoardNo) {
		UsedBoard ub = sqlSession.selectOne("usedBoard.selectUpdateUsedBoard", usedBoardNo);
		return ub;
	}

}