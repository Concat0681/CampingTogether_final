package kr.or.iei.member.controller;

import java.io.UnsupportedEncodingException;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileManager;
import javafx.scene.control.Alert;
import kr.or.iei.camping.model.service.CampingService;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingRoom;
import kr.or.iei.camping.model.vo.SellCampingListData;
import kr.or.iei.member.model.service.MailService;
import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.AdminShopPageData;
import kr.or.iei.member.model.vo.AllMemberPageData;
import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.CampingReservationPageData;
import kr.or.iei.member.model.vo.FileVO;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MemberPageData;
import kr.or.iei.member.model.vo.ProductPageData;
import kr.or.iei.member.model.vo.ProductPayment;
import kr.or.iei.member.model.vo.ReviewPageData;
import kr.or.iei.shop.model.service.ShopService;
//import kr.or.iei.member.model.vo.SellCampingPageData;
import kr.or.iei.shop.model.vo.ShopListMainData;
import kr.or.iei.usedBoard.model.service.UsedBoardService;
import kr.or.iei.usedBoard.model.vo.UsedBoardPageData;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	@Autowired
	private MailService mailService;
	@Autowired
	private CampingService campingService;
	@Autowired
	private UsedBoardService usedService;

	@Autowired
	private FileManager manager;
	
	

	//이메일 인증
	@RequestMapping(value="/mailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String mailCheck(String memberEmail) {
		System.out.println("이메일 인증 요청 성공 ");
		System.out.println("이메일 인증 이메일 : " + memberEmail);
		return mailService.mailCheck(memberEmail);
	}

	//로그인 폼 ---- 로그인은 회원가입 페이지에서 통합
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	
	//로그인
	@RequestMapping(value = "/login.do")
	public String login(Member member, HttpSession session, Model model) {
	    Member loginMember = service.selectOneMember(member);
	    if(loginMember == null) {
	        model.addAttribute("title", "로그인 실패");
			model.addAttribute("msg", "로그인 실패했습니다. 다시 시도해주세요.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/loginFrm.do");
			return "common/modalAlert";
	    } else if(loginMember.getMemberGrade().equals("B")) {
	    	String memberGrade = loginMember.getMemberGrade();
	        //model.addAttribute("memberGrade", memberGrade);
	        model.addAttribute("title", "로그인 실패");
			model.addAttribute("msg", "로그인 실패했습니다. 해당 계정은 신고 누적으로 정지상태입니다.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/loginFrm.do");
	        return "common/modalAlert";
	    } else {
	        session.setAttribute("m", loginMember);
	        return "redirect:/";
	    }
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입 폼
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	//회원가입
	@RequestMapping(value="/join.do")
	public String join(Model model, Member member) {
		int result = service.insertMember(member);
		if(result >0){
			System.out.println(result);
			System.out.println(member);
			return "redirect:/joinFrm.do";
			
		}else {
			model.addAttribute("title", "회원가입 완료");
			model.addAttribute("msg", "Welcome Comping Together");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/loginFrm.do");
			return "common/modalAlert";
		}
		

	}
	
	//회원가입시 아이디 중복 체크 
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(String memberId) {
		System.out.println("아이디 중복 확인");
		System.out.println(memberId);
		return service.idCheck(memberId);
	}
	
	//이름 + 이메일이용 Id찾기
	@RequestMapping(value="/searchId.do", method=RequestMethod.POST)
	@ResponseBody
	public String searchId(@RequestParam("memberName") String MemberName, @RequestParam("memberEmail") String MemberEmail, Member member) {
		System.out.println("이름"+MemberName);
		System.out.println("이메일"+MemberEmail);
		member.setMemberName(MemberName);
		member.setMemberEmail(MemberEmail);
		Member searchedMember = service.searchOneMemberId(member);
		if (searchedMember == null) { // 이름과 이메일이 일치하는 회원이 없으면 null 반환
			System.out.println("fail");
			return null;
		} else {
			System.out.println("complete");
			return searchedMember.getMemberId(); // 일치하는 회원이 있으면 아이디 반환
			
		}
	}
	//이름 + 이메일이용 Id찾기
		@RequestMapping(value="/searchPw.do", method=RequestMethod.POST)
		@ResponseBody
		public String searchPw(@RequestParam("memberId") String MemberId, @RequestParam("memberEmail") String MemberEmail, Member member) {
			System.out.println("이름"+MemberId);
			System.out.println("이메일"+MemberEmail);
			member.setMemberName(MemberId);
			member.setMemberEmail(MemberEmail);
			Member searchedMember = service.searchOneMemberPw(member);
			if (searchedMember == null) { // 이름과 이메일이 일치하는 회원이 없으면 null 반환
				System.out.println("fail");
				return null;
			} else {
				System.out.println("complete");
				return searchedMember.getMemberPw(); // 일치하는 회원이 있으면 아이디 반환
				
			}
		}
	
	@RequestMapping(value = "/mypageC.do")
	public String mypageC(Model model) {
		model.addAttribute("index",5);
		return "member/mypageCFrm";
	}
	
	
	@RequestMapping(value ="/allMemberChatFrm.do")
	public String allMemberChatFrm() {
		return"member/allMemberChatFrm";
		}
	
	@RequestMapping(value = "/allMemberChat.do")
	public String allMemberChat() {
		return "member/allMemberChat";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/pwCheck.do")
	public String checkPw(Member member) {
		Member m = service.selectOneMember(member);
		if(m != null) {
			return "ok";
		}
		return "error";
	}
	
	
	@RequestMapping(value = "/updateMypageCFrm") 
	public String updateMypageCFrm(Model model) {
		model.addAttribute("index",5);
		return "member/updateMypageCFrm";
	}
	
	
	//장바구니
	@RequestMapping(value = "/shopWishList.do")
	public String shopWishList(int reqPage, Model model, String memberId) {
		ShopListMainData slmd = service.selectWishList(reqPage, memberId);
		model.addAttribute("shopList", slmd.getShopList());
		model.addAttribute("navi", slmd.getPageNavi());
		return "member/shopWishList";
	}
	
	
	//회원 탈퇴
	@RequestMapping(value = "/deleteMember.do")
	public String deleteMember(int memberNo) {
		int result = service.deleteMember(memberNo);
		if(result>0) {
			return "redirect:/logout.do";
		}else {
			return "redirect:/";
		}
	}
	

	//캠핑장 결제 내역 리스트
	@RequestMapping(value = "/cmapingPayList.do")
	public String cmapingPayList(int reqPage,int memberNo, Model model) {
		MemberPageData mpd = service.selectPayList(memberNo, reqPage);
		model.addAttribute("list", mpd.getList() );
		model.addAttribute("navi", mpd.getPageNavi() );
		model.addAttribute("count", mpd.getTotalCount() );
		model.addAttribute("index",0);
		return "member/shopPayList";
	}
	
	//캠핑용품 결제 리스트
	@RequestMapping(value = "/productPayList.do")
	public String productPayList(int reqPage,String memberId, Model model) {
		ProductPageData ppd = service.productPayList(memberId, reqPage);	
		model.addAttribute("list", ppd.getList() );
		model.addAttribute("navi", ppd.getPageNavi() );
		model.addAttribute("count", ppd.getTotalCount());
		model.addAttribute("index",1);
		return "member/productPayList";
	}
	
	//내가 쓴 캠핑장리뷰
	@RequestMapping(value = "/myRiview.do")
	public String myRiview(int reqPage,String memberId, Model model) {
		ReviewPageData rpd = service.myReviewList(memberId, reqPage);
		model.addAttribute("list",rpd.getList());
		model.addAttribute("navi", rpd.getPageNavi());
		model.addAttribute("count", rpd.getTotalCount());
		model.addAttribute("index",2);
		return "member/myReviewList";
	}
	
	//찜한목록
	@RequestMapping(value = "/myUsedSellList.do")
	public String usedWishList(int reqPage,String memberId, Model model) {
		String usedBoardWriter = memberId;
		UsedBoardPageData upd = usedService.selectUsedBoardList(reqPage, memberId, usedBoardWriter);
		model.addAttribute("totalCount", upd.getTotalCount());
		model.addAttribute("list", upd.getList());
		model.addAttribute("pageNavi", upd.getPageNavi());
		model.addAttribute("index",4);
		return "member/myUsedSellList";
	
	}
	

	//판매자 my캠핑장
	@RequestMapping(value = "/sellList.do")
	public String sellList(int reqPage, String memberId, Model model) {
		SellCampingListData scld = campingService.getSellCampingList(memberId, reqPage);
		model.addAttribute("list",scld.getCampingList());
		model.addAttribute("navi", scld.getPageNavi());
		model.addAttribute("index",0);
		return "member/sellList";
	}
	
	
	//일반회원 정보 수정
	@RequestMapping(value = "/updateMypageC.do")
	public String updateMypageC(Member member, String delProfile, MultipartFile profileName, HttpServletRequest requset, HttpSession session ) {
		String savePath = requset.getSession().getServletContext().getRealPath("/resources/image/member/");
		System.out.println(member);
		if(delProfile != "") {
			manager.deleteFile(savePath, delProfile);
			member.setMemberPhoto(null);
		}
		if(!profileName.isEmpty()) {
				String upFilepath = manager.upload(savePath, profileName);
				member.setMemberPhoto(upFilepath);
		}
		int result = service.updateMypageC(member);
		
		if(result > 0) {
			System.out.println(member);
			session.setAttribute("m", member);
			return "redirect:/mypageC.do";
		} else {
			return "redirect:/";
		}
	}
	
	//shop 판매상품(관리자)
	@RequestMapping(value = "/shopProductList.do")
	public String shopList(String memberId, int reqPage, Model model) {
		AdminShopPageData aspd = service.selectAdminShopList(memberId, reqPage);
		model.addAttribute("list",aspd.getList());
		System.out.println(aspd.getList());
		model.addAttribute("navi",aspd.getPageNavi());
		model.addAttribute("count",aspd.getTotalCount());
		model.addAttribute("index",0);
		return "member/shopList";
	}
	
	
	
	//전체 회원
	@RequestMapping(value = "/allMember.do")
	public String allMember(int reqPage, Model model) {
		AllMemberPageData apd = service.selectAllMember(reqPage);
		model.addAttribute("list",apd.getList());
		model.addAttribute("navi", apd.getPageNavi());
		model.addAttribute("count", apd.getTotalCount());
		model.addAttribute("index",1);
		return "member/allMemberList";
	}
	

	
	//판매자 정보 수정
	@RequestMapping(value = "/mypageS.do")
	public String mypageS(Model model) {
		model.addAttribute("index",2);
		return "member/mypageSFrm";
	}
	
	
	@RequestMapping(value="/deleteWishList.do")
	public String deleteWishList(int shopNo, String memberId) {
		int result = service.deleteWishList(shopNo);
		if(result > 0) {
			return "redirect:/shopWishList.do?reqPage=1&memberId="+memberId;
		}else {
			return "redirect:/";
		}
	}
	
	
	//회원 정보
	@ResponseBody
	@RequestMapping(value = "/adminOneMember.do", produces="application/json;charset=utf-8")
	public String adminOneMember(int memberNo) {
		Member member = service.adminOneMember(memberNo);
		return new Gson().toJson(member);
	}
	
	@RequestMapping(value = "/selectAllMemberId.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String selectId() {
		ArrayList<String> list = service.selectId();
		System.out.println(list);
		return new Gson().toJson(list);
	}
	//my캠핑장 룸 조회
	@ResponseBody
	@RequestMapping(value = "/selectRoomInfo.do", produces="application/json;charset=utf-8")
	public String sellectRoomInfo(int campingNo,  Model model) {
		ArrayList<CampingRoom> cr = service.selectCampingRoom(campingNo);
		System.out.println(cr);
		return new Gson().toJson(cr);
	}
	
	//관리자 정보
	@RequestMapping(value = "/adminMember.do")
	public String selectAdminMember(String memberId, Model model) {
		Member member = service.selectAdminMember(memberId);
		model.addAttribute("list",member);
		model.addAttribute("index",3);
		return "member/mypageAFrm";
	}
	
	//관리자 비밀번호 변경
	@RequestMapping(value = "/adminPwUpdate.do")
	public String adminPwUpdate(Member member,@SessionAttribute(required = false) Member m) {
		int result = service.updateAdminPw(member);
		if(result >0) {
			m.setMemberPw(member.getMemberPw());
		}
		return "redirect:/adminMember.do";
	}
	
	//찜한 캠핑장 
	@RequestMapping(value = "/campingBookmark.do")
	public String campingBookmark(String memberId, Model model) {
		int reqPage = 1;
		String order = "avgReviewRating";
		CampingRoom campingRoom = new CampingRoom();
		Camping camping = new Camping();
		if(memberId != null) {
			camping.setMemberId(memberId);
		}
		ArrayList<Camping> list = new ArrayList<Camping>();
		CampingListPageData cpd = campingService.selectCampingListData(reqPage, order, camping, campingRoom);
		for(Camping c : cpd.getList()) {
			if(c.getCampingBookmarkNo() != 0) {
				list.add(c);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("index",3);
		return "member/campingBookmark";
	}
	
	//캠핑장 예약 현황
	@RequestMapping(value = "/campingReservation.do")
	public String campingReservation(int reqPage, String memberId, Model model) {
		CampingReservationPageData crpd = service.selectCampingReservation(memberId, reqPage);
		model.addAttribute("list",crpd.getList());
	System.out.println(crpd.getList().size());
		model.addAttribute("navi",crpd.getPageNavi());
		model.addAttribute("count",crpd.getTotalCount());
		model.addAttribute("index",1);
			return "member/reservationList";
	}
	
	
}




