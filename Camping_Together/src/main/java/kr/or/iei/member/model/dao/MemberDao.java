package kr.or.iei.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.Member;

@Repository
public class MemberDao {

	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public Member selectOneMember(Member member) {
		System.out.println(member);
		Member m = sqlsession.selectOne("member.selectOneMember", member);
		return m;
	}

	public int insertMember(Member member) {
		int result = sqlsession.insert("member.insertMember", member);
		return result;
	}

	public int deleteMember(int memberNo) {
		int result = sqlsession.delete("member.deleteMember",memberNo);
		return result;
	}


	/*
	public ArrayList<CampingPayment> selectPayList(int memberNo) {
		List list = sqlsession.selectList("member.selectPayList",memberNo);
		return (ArrayList<CampingPayment>)list;
	}
	*/

	//로그인회원 캠핑장 결제 리스트
	public ArrayList<CampingPayment> selectPayList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectPayList",map);
		return (ArrayList<CampingPayment>)list;
	}

	//로그인회원 캠핑장 결제내역 총 게시물 수
	public int selectPayListCount(int memberNo) {
		int totalCount = sqlsession.selectOne("member.totalCount",memberNo);
		return totalCount;
	}
	
	
	
	
	
	
	
	
	
}





