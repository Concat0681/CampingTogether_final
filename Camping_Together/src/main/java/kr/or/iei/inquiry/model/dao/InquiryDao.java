package kr.or.iei.inquiry.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.board.food.model.vo.BoardFood;
import kr.or.iei.inquiry.model.vo.AdminInquiry;
import kr.or.iei.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDao {

	@Autowired
	private SqlSessionTemplate sqlsession;

	public ArrayList<Inquiry> selectInquiry(HashMap<String, Object> map) {
		List list = sqlsession.selectList("inquiry.selectInquiry", map);
		return (ArrayList<Inquiry>)list;
	}

	public int selectInquiryCount() {
		int totalCount = sqlsession.selectOne("inquiry.selectTotalCount");
		return totalCount;
	}

	public int insertInquiry(Inquiry iq) {
		int result = sqlsession.insert("inquiry.insertInquiry",iq);
		return result;
	}

	public int updateInquiry(Inquiry iq) {
		int result = sqlsession.update("inquiry.updateInquiry",iq);
		return result;
	}

	public int deleteInquiry(int inquiryNo) {
		int result = sqlsession.delete("inquiry.deleteInquiry", inquiryNo);
		return result;
	}

	public int insertAdminInquiry(AdminInquiry ai) {
		int result = sqlsession.insert("inquiry.insertAdminInquiry",ai);
		return result;
	}

	public void updateInquiryStatus(int inquiryNo) {
		int result = sqlsession.update("inquiry.updateInquiryStatus",inquiryNo);
		
	}

	public ArrayList<AdminInquiry> selectAdminInquiryList(AdminInquiry ai) {
		List list = sqlsession.selectList("inquiry.selectAdminInquiryList",ai);
		System.out.println(list);
		return (ArrayList<AdminInquiry>)list;
	}

	public AdminInquiry selectAllAdminInquiry(int inquiryNo) {
		AdminInquiry ai = sqlsession.selectOne("inquiry.selectAllAdminInquiry",inquiryNo);
		return ai;
	}




	
}
