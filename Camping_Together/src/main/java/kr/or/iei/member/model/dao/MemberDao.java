package kr.or.iei.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MyReview;
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

	//캠핑장 결제리스트 
	public ArrayList<CampingPayment> selectPayList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectPayList",map);
		return (ArrayList<CampingPayment>)list;
	}

	//캠핑장 결제리스트 총 게시물 수 
	public int selectPayListCount(int memberNo) {
		int totalCount = sqlsession.selectOne("member.totalCount",memberNo);
		return totalCount;
	}

	//로그인회원 SHOP 결제 리스트
	public ArrayList<ProductPayment> selectProductPayList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectProcuctPayList",map);
		return (ArrayList<ProductPayment>)list;
	}

	//로그인회원 쇼핑몰 결제내역 총 게시물 수
	public int selectProductPayListCount(String memberId) {
		int totalCount = sqlsession.selectOne("member.productTotalCount",memberId);
		return totalCount;
		
	}
	
	public int idCheck(String memberId) {
		return sqlsession.selectOne("member.idCheck", memberId);
	}

	//내가 쓴 캠핑장 리뷰 리스트
	public ArrayList<MyReview> selectMyReviewList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectMyReviewList",map);
		return (ArrayList<MyReview>)list;
	}

	//내가 쓴 캠핑장 리뷰 리스트 총 게시물 수 
	public int selectMyReviewListCount(String memberId) {
		int totalCount = sqlsession.selectOne("member.selectMyReviewListCount",memberId);
		return totalCount;
	}

	//일반회원 정보 수정
	public int updateMember(Member member) {
		int result = sqlsession.update("member.updateMypageC",member );
		return result;
	}

	//프로필이미지 업로드
	public int updateFilepath(MultipartFile profileName) {
		int result = sqlsession.update("member.updateFile",profileName);
		return 0;
	}

	
	/*
	//판매자 my캠핑장
	public ArrayList<SellCampingList> selectSellCampingList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectSellCampingList",map);
		return (ArrayList<SellCampingList>) list;
	}
	*/
	
	
	
	
	
	
	
	
}





