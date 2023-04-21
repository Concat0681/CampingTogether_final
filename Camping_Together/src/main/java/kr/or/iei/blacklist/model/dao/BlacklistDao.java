package kr.or.iei.blacklist.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	public ArrayList<Blacklist> selectAllBlacklist(HashMap<String, Object> map) {
		List list = sqlSession.selectList("blacklist.selectAllBlacklist", map);
		return (ArrayList<Blacklist>)list;
	}

	public int selectBlacklistCount() {
		int totalCount = sqlSession.selectOne("blacklist.selectBlacklistCount");
		return totalCount;
	}

	public Blacklist selectOneBlacklist(int blacklistNo) {
		Blacklist bl = sqlSession.selectOne("blacklist.selectOneBlacklist", blacklistNo);
		return bl;
	}

	public ArrayList<BlacklistPhoto> selectOneBlacklistPhoto(int blacklistNo) {
		List list = sqlSession.selectList("blacklist.selectOneBlacklistPhoto", blacklistNo);
		return (ArrayList<BlacklistPhoto>)list;
	}
}
