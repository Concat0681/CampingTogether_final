package kr.or.iei.board.food.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.board.food.model.vo.BoardFood;
import kr.or.iei.board.food.model.vo.FileVO;
import kr.or.iei.board.food.model.vo.FoodComment;
import kr.or.iei.notice.model.vo.Notice;

@Repository
public class BoardFoodDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<BoardFood> selectFoodList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("boardFood.selectFoodList",map);
		return (ArrayList<BoardFood>)list;
	}

	public int selectFoodCount() {
		int totalCount = sqlSession.selectOne("boardFood.totalCount");
		return totalCount;
	}

	public int insertBoardFood(BoardFood b) {
		int result = sqlSession.insert("boardFood.insertBoardFood",b);
		return result;
	}

	public int insertFile(FileVO file) {
		int result = sqlSession.insert("boardFood.insertFile",file);
		return result;
	}

	public int updateReadCount(int boardFoodNo) {
		int result = sqlSession.update("boardFood.updateReadCount",boardFoodNo);
		return result;
	}

	public BoardFood selectOneBoardFood(int boardFoodNo) {
		BoardFood bf = sqlSession.selectOne("boardFood.selectOneBoardFood",boardFoodNo);
		return bf;
	}

	public ArrayList<FoodComment> selectFoodComment(int boardFoodNo) {
		List list = sqlSession.selectList("boardFood.selectFoodComment",boardFoodNo);
		return (ArrayList<FoodComment>)list;
	}

	public ArrayList<FoodComment> selectReCommentList(int boardFoodNo) {
		List list = sqlSession.selectList("boardFood.selectReCommentList",boardFoodNo);
		return (ArrayList<FoodComment>)list;
	}


}
