package kr.or.iei.usedBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardComment;
import kr.or.iei.usedBoard.model.vo.UsedBoardPhoto;

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

	public int selectBoardCount() {
		int totalCount = sqlSession.selectOne("usedBoard.totalCount"); 
		return totalCount;
	}

	public int updateReadCount(int usedBoardNo) {
		int result = sqlSession.update("usedBoard.updateReadCount", usedBoardNo);
		return result;
	}

	public UsedBoard selectOneUsedBoard(int usedBoardNo) {
		UsedBoard ub = sqlSession.selectOne("usedBoard.selectOneUsedBoard", usedBoardNo);
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
}
