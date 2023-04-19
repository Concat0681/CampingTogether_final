package kr.or.iei.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MemberPageData;
import kr.or.iei.member.model.vo.MyReview;
import kr.or.iei.member.model.vo.ProductPageData;
import kr.or.iei.member.model.vo.ProductPayment;
import kr.or.iei.member.model.vo.ReviewPageData;
import kr.or.iei.member.model.vo.SellCampingList;
import kr.or.iei.shop.model.vo.Shop;
import kr.or.iei.shop.model.vo.ShopBasket;
import kr.or.iei.shop.model.vo.ShopListMainData;
import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardPageDate;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;
	
	public Member selectOneMember(Member member) {
		return dao.selectOneMember(member);
	}

	@Transactional
	public int insertMember(Member member) {
		dao.insertMember(member);
		return 0;
	}

	public int idCheck(String memberId) {
		System.out.println("아이디 중복 서비스 확인");
		return dao.idCheck(memberId);
	}

	// 占쎌돳占쎌뜚占쎄퉱占쎈닚
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

	public MemberPageData selectPayList(int memberNo, int reqPage) {
		int numPerpage = 5;

		// reqPage = 1 -> 1~2, reqPage = 2 -> 2~3
		int end = reqPage * numPerpage;
		int start = end - numPerpage + 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);

		ArrayList<CampingPayment> list = dao.selectPayList(map);

		int totalCount = dao.selectPayListCount(memberNo);

		int totalPage = (int) Math.ceil(totalCount / (double) numPerpage);

		// pageNavi
		int pageNaviSize = 5;

		int pageNo = 1;
		if (reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지네비 생성 시작
		String pageNavi = "<ul class='pagination circle-style'>";

		// 이전버튼
		if (pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage=" + (pageNo - 1) + "&memberNo="
					+ memberNo + "'>";
			pageNavi += "<span class='material-symbols-outlined'>chevron_left</span>";
			pageNavi += "</a></li>";

		}

		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/cmapingPayList.do?reqPage=" + pageNo + "&memberNo="+ memberNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage=" + pageNo + "&memberNo=" + memberNo+ "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNavi += "</ul>";
			
			MemberPageData mpd = new MemberPageData(list,pageNavi);
			 return mpd;
			}

		//�씠�쟾 踰꾪듉
		if(pageNo != 1) {
		pageNavi += "<a href='/cmapingPayList.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'>[�씠�쟾]</a>";
		}
		
		//�럹�씠吏� �닽�옄 �깮�꽦
		for(int i=0;i<pageNaviSize;i++) {
		if(pageNo ==  reqPage) {
			pageNavi += "<span>"+pageNo+"</span>";
		}else {
			pageNavi += "<a href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>"+pageNo+"</a>";
				}
		pageNo++;
		if(pageNo > totalPage) {
		 break;
		}

		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage=" + pageNo + "&memberNo=" + memberNo+ "'>";
			pageNavi += "<span class='material-symbols-outlined'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";

		MemberPageData mpd = new MemberPageData(list, pageNavi);
		return mpd;
		}
		return null;
	}

	// 캠핑용품 결제 리스트
	public ProductPageData productPayList(String memberId, int reqPage) {
		int numPerpage = 5;

		// reqPage = 1 -> 1~2, reqPage = 2 -> 2~3
		int end = reqPage * numPerpage;
		int start = end - numPerpage + 1;

		// 계산된 start, end를 가지고 게시물 목록 조회
		// Mybatis는 매개변수는 한개만 설정이 가능 -> 필요한 값이 여러개면 1개로 묶어야함 (vo또는 map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);

		ArrayList<ProductPayment> list = dao.selectProductPayList(map);

		// 전체 게시물 수 필요 -> 전체 게시물 수 조회
		int totalCount = dao.selectProductPayListCount(memberId);

		// 전체게시물로 전체 페이지 수 계산
		int totalPage = (int) Math.ceil(totalCount / (double) numPerpage);

		// pageNavi사이즈
		int pageNaviSize = 5;

		int pageNo = 1;
		if (reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지네비 생성 시작
		String pageNavi = "<ul class='pagination circle-style'>";

		// 이전 버
		if (pageNo != 1) {

			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage=" + (pageNo - 1) + "&memberNo="+ memberId + "'>";
			pageNavi += "<span class='material-symbols-outlined'>chevron_left</span>";
			pageNavi += "</a></li>";

		}

		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/cmapingPayList.do?reqPage=" + pageNo + "&memberNo="+ memberId + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage=" + pageNo + "&memberNo=" + memberId+ "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			// for문을 중간에 탈출해야하는 경우가 있음 - 페이지가 끝나면 그 이후페이지(없는페이지)는 출력X
			if (pageNo > totalPage) {
				break;
			}
		}

		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage=" + pageNo + "&memberNo=" + memberId+ "'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";

		ProductPageData ppd = new ProductPageData(list, pageNavi);
		return ppd;
	}

	
	//내가쓴 리뷰 리스트
	public ReviewPageData myReviewList(String memberId, int reqPage) {
		int numPerpage = 5;

		// reqPage = 1 -> 1~2, reqPage = 2 -> 2~3
		int end = reqPage * numPerpage;
		int start = end - numPerpage + 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		
		ArrayList<MyReview> list = dao.selectMyReviewList(map);
		
		
		int totalCount = dao.selectMyReviewListCount(memberId);

		int totalPage = (int) Math.ceil(totalCount / (double) numPerpage);
		
		// pageNavi사이즈
				int pageNaviSize = 5;

				int pageNo = 1;
				if (reqPage > 3) {
					pageNo = reqPage - 2;
				}

				// 페이지네비 생성 시작
				String pageNavi = "<ul class='pagination circle-style'>";

				// 이전 버
				if (pageNo != 1) {

					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/myRiview.do?reqPage=" + (pageNo - 1) + "&memberId="+ memberId + "'>";
					pageNavi += "<span class='material-symbols-outlined'>chevron_left</span>";
					pageNavi += "</a></li>";

				}

				// 페이지 숫자 생성
				for (int i = 0; i < pageNaviSize; i++) {
					if (pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/myRiview.do?reqPage=" + pageNo + "&memberId="+ memberId + "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					} else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/myRiview.do?reqPage=" + pageNo + "&memberId=" + memberId+ "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}
					pageNo++;
					
					if (pageNo > totalPage) {
						break;
					}
				}

				// 다음버튼
				if (pageNo <= totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/myRiview.do?reqPage=" + pageNo + "&memberNo=" + memberId+ "'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";

				ReviewPageData rpd = new ReviewPageData(list, pageNavi);
				return rpd;
	}
	
	//회원 아이디 찾기
	public Member searchOneMemberId(Member member) {
		return dao.searchOneMemberId(member);
	}
	
	//회원 비밀번호 찾기
	public Member searchOneMemberPw(Member member) {
		return dao.searchOneMemberPw(member);
	}

	public ShopListMainData selectWishList(int reqPage, String memberId) {
		int numPerPage = 9;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		ArrayList<Shop> list = dao.selectWishList(map);
		int totalCount = dao.selectShopBasketCount(memberId);
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int pageNaviSize = 10;
		
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/shopWishList.do?reqPage="+(pageNo-1)+"'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
			for(int i=0; i<pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li><a class='page-item active-page'>"+pageNo+"</a></li>";
				}else {
					pageNavi += "<li><a class='page-item' href='/shopWishList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
		if(pageNo <= totalPage) {
			pageNavi += "<li><a class='page-item' href='/shopWishList.do?reqPage="+(pageNo+1)+"'><span class='material-symbols-outlined'>chevron_right </span></a></li>";
		}
		ShopListMainData slmd = new ShopListMainData(list, pageNavi);
		return slmd;
		
	}

	
	//일반회원 정보 수정
	public int updateMypageC(Member member) {
		return dao.updateMember(member);
		
	}
	/*
	//프로필이미지 업로드
	public int updateFilepath(String upFilepath) {
		return dao.updateFilepath(upFilepath);
	}
	 */
	

}



