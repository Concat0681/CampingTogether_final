package kr.or.iei.camping.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.camping.model.vo.Camping;

@Repository
public class CampingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Camping> selectBoardList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("");
		return (ArrayList<Camping>)list;
	}

	public int selectBoardCount() {
		// TODO Auto-generated method stub
		return 0;
	}
}
