package kr.or.iei.board.food.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.board.food.model.vo.BoardFood;
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
}
