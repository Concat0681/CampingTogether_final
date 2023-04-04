package kr.or.iei.camping.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingProvide;
import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.camping.model.vo.CampingRoomFileVO;

@Repository
public class CampingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Camping> selectCampingListData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("camping.selectCampingListData", map);
		return (ArrayList<Camping>)list;
	}

	public int selectCampingCount() {
		int totalCount = sqlSession.selectOne("camping.selectCampingCount");
		return totalCount;
	}

	public int insertCamping(Camping c) {
		int result = sqlSession.insert("camping.insertCamping",c);
		return result;
	}

	public Camping selectOneCamping(int campingNo) {
		Camping camping = sqlSession.selectOne("camping.selectOneCamping", campingNo);
		return camping;
	}

	public ArrayList<CampingRoom> selectAllCampingRoomList(int campingNo) {
		List roomList = sqlSession.selectList("camping.selectAllCampingRoomList", campingNo);
		return (ArrayList<CampingRoom>)roomList;
	}

	public ArrayList<CampingProvide> selectAllCampingProvideList(int campingNo) {
		return null;
	}
	
	public int insertCampingRoom(CampingRoom cr) {
		int result = sqlSession.insert("camping.insertCampingRoom",cr);
		return result;
	}

	public int insertCampingRoomPhoto(CampingRoomFileVO file) {
		int result = sqlSession.insert("camping.insertCampingRoomPhoto",file);
		return result;
	}
}
