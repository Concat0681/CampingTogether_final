package kr.or.iei.blacklist.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.blacklist.model.vo.Blacklist;
import kr.or.iei.blacklist.model.vo.BlacklistPhoto;
import kr.or.iei.usedBoard.model.vo.UsedBoard;

@Repository
public class BlacklistDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UsedBoard selectBlackUsedBoard(int usedBoardNo) {
		UsedBoard ub = sqlSession.selectOne("blacklist.selectBlackUsedBoard", usedBoardNo);
		return ub;
	}

	public int insertBlacklist(Blacklist bl) {
		int result = sqlSession.insert("blacklist.insertBlacklist", bl);
		return result;
	}

	public int insertBlacklistPhoto(BlacklistPhoto photo) {
		int result = sqlSession.insert("blacklist.insertBlacklistPhoto", photo);
		return result;
	}

	public ArrayList<Blacklist> selectBlacklistMyHistory(String memberId) {
		List list = sqlSession.selectList("blacklist.selectBlacklistMyHistory", memberId);
		return (ArrayList<Blacklist>)list;
	}
}
