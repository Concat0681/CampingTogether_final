package kr.or.iei.usedBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.usedBoard.model.vo.UsedBoard;
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
}
