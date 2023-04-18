package kr.or.iei.camping.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingEtc;
import kr.or.iei.camping.model.vo.CampingProvideService;
import kr.or.iei.camping.model.vo.CampingReview;
import kr.or.iei.camping.model.vo.CampingReviewFileVO;
import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.camping.model.vo.CampingRoomFileVO;
import kr.or.iei.camping.model.vo.CampingRoomService;
import kr.or.iei.camping.model.vo.SellCampingList;

@Repository
public class CampingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Camping> selectCampingListData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("camping.selectCampingListData", map);
		return (ArrayList<Camping>)list;
	}

	public int selectCampingCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("camping.selectCampingCount" , map);
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
	
	public int insertCampingRoom(CampingRoom cr) {
		int result = sqlSession.insert("camping.insertCampingRoom",cr);
		return result;
	}

	public int insertCampingRoomPhoto(CampingRoomFileVO file) {
		int result = sqlSession.insert("camping.insertCampingRoomPhoto",file);
		return result;
	}

	public int insertCampingProvideService(CampingProvideService cps) {
		int result = sqlSession.insert("camping.insertCampingProvideService",cps);
		return result;
	}

	public int insertCampingRoomService(CampingRoomService crs) {
		int result = sqlSession.insert("camping.insertCampingRoomService",crs);
		return result;
	}

	public int insertCampingEtc(CampingEtc ce) {
		int result = sqlSession.insert("camping.insertCampingEtc",ce);
		return result;
	}

	public ArrayList<CampingRoomFileVO> selectCampingRoomFileList(int campingRoomNo) {
		List list = sqlSession.selectList("camping.selectCampingRoomFileList", campingRoomNo);
		return (ArrayList<CampingRoomFileVO>)list;
	}

	public int insertCampingReview(CampingReview crv) {
		int result = sqlSession.insert("camping.insertCampingReview", crv);
		return result;
	}

	public int insertCampingReviewPhoto(CampingReviewFileVO file) {
		int result = sqlSession.insert("camping.insertCampingReviewPhoto", file);
		return result;
	}

	public ArrayList<CampingReview> selectCampingReview(int campingNo) {
		List list = sqlSession.selectList("camping.selectCampingReview",campingNo);
		return (ArrayList<CampingReview>)list;
	}

	public List<Integer> selectCampingReviewNo(int campingNo) {
	    return sqlSession.selectList("camping.selectCampingReviewNo", campingNo);
	}

	public ArrayList<CampingReviewFileVO> selectCampingReviewPhoto(int campingReviewNo) {
		List list = sqlSession.selectList("camping.selectCampingReviewPhoto",campingReviewNo);
		return (ArrayList<CampingReviewFileVO>)list;
	}

	public int insertReviewComment(CampingReview crv) {
		int result = sqlSession.insert("camping.insertReviewComment", crv);
		return result;
	}

	public ArrayList<CampingReview> selectReviewCommentList(int campingNo) {
		List list = sqlSession.selectList("camping.selectReviewCommentList",campingNo);
		return (ArrayList<CampingReview>)list;
	}

	public ArrayList<CampingReviewFileVO> selectCampingReviewFile(int campingReviewNo) {
		List list = sqlSession.selectList("camping.selectCampingReviewFile", campingReviewNo);
		return (ArrayList<CampingReviewFileVO>)list;
	}

	public int deleteCampingReview(int campingReviewNo) {
		int result = sqlSession.delete("camping.deleteCampingReview",campingReviewNo);
		return result;
	}

	public int deleteCampingReviewComment(int campingReviewNo) {
		int result = sqlSession.delete("camping.deleteCampingReviewComment",campingReviewNo);
		return result;
	}

	

	
	public ArrayList<SellCampingList> getSellCampingList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("camping.getSellCampingList", map);
		return (ArrayList<SellCampingList>)list;
	}

	public int updateReviewComment(CampingReview crv) {
		int result = sqlSession.update("camping.updateReviewComment",crv);
		return result;
	}

	public int selectReviewCount(int campingNo) {
		int selectReviewCount = sqlSession.selectOne("camping.selectReviewCount",campingNo);
		return selectReviewCount;
	}

	public int selectReviewCommentCount(int campingNo) {
		int selectReviewCommentCount = sqlSession.selectOne("camping.selectReviewCommentCount",campingNo);
		return selectReviewCommentCount;
	}

	public int selectcampingReviewRatingAvg(int campingNo) {
		int campingReviewRatingAvg = sqlSession.selectOne("camping.selectcampingReviewRatingAvg",campingNo);
		return campingReviewRatingAvg;
	}

	public CampingReview getReviewInfo(int campingReviewNo) {
		return sqlSession.selectOne("camping.getReviewInfo",campingReviewNo);
	}

	public ArrayList<CampingReviewFileVO> getReviewFile(int campingReviewNo) {
		List list = sqlSession.selectList("camping.getReviewFile",campingReviewNo);
		return (ArrayList<CampingReviewFileVO>)list;
	}

	public int updateCampingReview(CampingReview crv) {
		int result = sqlSession.update("camping.updateCampingReview",crv);
		return result;
	}

	public int deleteCampingReviewFile(int no) {
		int result = sqlSession.delete("camping.deleteCampingReviewFile",no);
		return result;
	}

	
	public int selectSellCampingCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("camping.selectSellCampingCount", map);
		return totalCount;
	}
}
