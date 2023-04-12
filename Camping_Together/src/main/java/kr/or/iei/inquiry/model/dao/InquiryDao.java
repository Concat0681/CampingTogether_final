package kr.or.iei.inquiry.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.board.food.model.vo.BoardFood;
import kr.or.iei.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDao {

	@Autowired
	private SqlSessionTemplate sqlsession;

	public ArrayList<Inquiry> selectInquiry(HashMap<String, Object> map) {
		List list = sqlsession.selectList("inquiry.selectInquiry", map);
		System.out.println("dao:"+list);
		return (ArrayList<Inquiry>)list;
	}

	public int selectInquiryCount() {
		int totalCount = sqlsession.selectOne("inquiry.selectTotalCount");
		return totalCount;
	}



	
}
