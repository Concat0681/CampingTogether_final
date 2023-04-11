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
import kr.or.iei.member.model.vo.ProductPayment;

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

	//濡쒓렇�씤�쉶�썝 罹좏븨�옣 寃곗젣 由ъ뒪�듃
	public ArrayList<CampingPayment> selectPayList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectPayList",map);
		return (ArrayList<CampingPayment>)list;
	}

	//濡쒓렇�씤�쉶�썝 罹좏븨�옣 寃곗젣�궡�뿭 珥� 寃뚯떆臾� �닔
	public int selectPayListCount(int memberNo) {
		int totalCount = sqlsession.selectOne("member.totalCount",memberNo);
		return totalCount;
	}

<<<<<<< HEAD
	//로그인회원 SHOP 결제 리스트
	public ArrayList<ProductPayment> selectProductPayList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectProcuctPayList",map);
		return (ArrayList<ProductPayment>)list;
	}

	//로그인회원 쇼핑몰 결제내역 총 게시물 수
	public int selectProductPayListCount(String memberId) {
		int totalCount = sqlsession.selectOne("member.productTotalCount",memberId);
		return totalCount;
=======
	public int idCheck(String memberId) {
		return sqlsession.selectOne("member.idCheck", memberId);
>>>>>>> main
	}
	
	
	
	
	
	
	
	
	
}





