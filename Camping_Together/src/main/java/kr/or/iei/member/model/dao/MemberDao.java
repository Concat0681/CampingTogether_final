package kr.or.iei.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.member.model.vo.AdminShopList;
import kr.or.iei.member.model.vo.AdminShopPageData;
import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.CampingReservationList;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MyReview;
import kr.or.iei.member.model.vo.ProductPayment;

import kr.or.iei.shop.model.vo.Shop;
import kr.or.iei.shop.model.vo.ShopBasket;



@Repository
public class MemberDao {

	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	//회원조회
	public Member selectOneMember(Member member) {
		System.out.println(member);
		Member m = sqlsession.selectOne("member.selectOneMember", member);
		return m;
	}
	
	//회원 아아디 찾기
	public Member searchOneMemberId(Member member) {
		Member m = sqlsession.selectOne("member.searchOneMemberId", member);
		return m;
	}
	//회원 비밀번호 찾기
		public Member searchOneMemberPw(Member member) {
			Member m = sqlsession.selectOne("member.searchOneMemberPw", member);
			return m;
		}
	
	
	//회원 가입
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

	public ArrayList<Shop> selectWishList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("shop.selectWishList",map);
		return (ArrayList<Shop>)list;
	}

	public int selectShopBasketCount(String memberId) {
		int totalCount = sqlsession.selectOne("member.selectShopBasketCount",memberId);
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

	public int deleteWishList(int shopNo) {
		int result = sqlsession.delete("member.deleteWishList",shopNo);
		return result;
	}

	
	//전체회원
	public ArrayList<Member> selectAllMember(HashMap<String, Object> map) {
		List<Member> list = sqlsession.selectList("member.selectAllMember",map);
		return (ArrayList<Member>)list;
	}

	//전체회원 수
	public int selectAllMemberCount() {
		int totalCount = sqlsession.selectOne("member.selectAllMemberCount");
		return totalCount;
	}

	//회원정보(관리자)
	public Member adminOneMember(int memberNo) {
		Member member = sqlsession.selectOne("member.adminOneMember", memberNo);
		return member;
	}

	//shop 상품 관리(관리자)
	public ArrayList<AdminShopList> selectAdminShopList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectAdminShop", map);
		return (ArrayList<AdminShopList>)list;
	}

	public int selectAdminShopCount() {
		int totalCount = sqlsession.selectOne("member.selectAdminShopCount");
		return totalCount;
	}
	
	public ArrayList<String> selectId() {
		List list = sqlsession.selectList("member.selectId");
		return (ArrayList<String>)list;
	}

	public ArrayList<CampingRoom> selectCampingRoom(int campingNo) {
		List list = sqlsession.selectList("member.selectCampingRoom",campingNo);
		return (ArrayList<CampingRoom>) list;
	}

	//관리자 정보
	public Member selectAdminember(String memberId) {
		Member member = sqlsession.selectOne("member.selectAdminMember",memberId);
		return member;
	}

	
	public int updateAdminPw(Member member) {
		int result = sqlsession.insert("member.updateAdminPw", member);
		return result;
	}

	//캠핑장 예약 현황리스트
	public ArrayList<CampingReservationList> selectReservationList(HashMap<String, Object> map) {
		List list = sqlsession.selectList("member.selectCampingReservationList",map);
		return (ArrayList<CampingReservationList>)list;
	}

	public int selectReservationListCount(String memberId) {
		int totalCount = sqlsession.selectOne("member.selectReservationListCount",memberId);
		return totalCount;
	}


	
	
	
	
	
	
	
	
	
}





