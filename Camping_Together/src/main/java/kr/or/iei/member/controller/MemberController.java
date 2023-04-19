package kr.or.iei.member.controller;

import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.Random;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
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


import common.FileManager;
import kr.or.iei.camping.model.service.CampingService;
import kr.or.iei.camping.model.vo.SellCampingListData;
import kr.or.iei.member.model.service.MailService;
import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MemberPageData;
import kr.or.iei.member.model.vo.ProductPageData;
import kr.or.iei.member.model.vo.ReviewPageData;
//import kr.or.iei.member.model.vo.SellCampingPageData;
import kr.or.iei.shop.model.vo.ShopListMainData;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	@Autowired
	private MailService mailService;
	
	@Autowired
	private CampingService cmapingService;


	//이메일 인증

	@RequestMapping(value="/mailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String mailCheck(String memberEmail) {
		System.out.println("이메일 인증 요청 성공 ");
		System.out.println("이메일 인증 이메일 : " + memberEmail);
		return mailService.mailCheck(memberEmail);
	}
	
	@Autowired
	private FileManager manager;
	
	
	//로그인 폼 ---- 로그인은 회원가입 페이지에서 통합

	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping(value = "/login.do")
	public String login(Member member, HttpSession session){
	//public String login(Member member) {
		Member loginMember = service.selectOneMember(member);
		if(loginMember != null) {
			session.setAttribute("m", loginMember);
		}
		return "redirect:/";
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
	public String join(Member member) {
		int result = service.insertMember(member);
		if(result >0){
			System.out.println(result);
			System.out.println(member);
			return "redirect:/joinFrm.do";
			
		}else {
			System.out.println(result);
			System.out.println(member);
			return "redirect:/";
		
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
		model.addAttribute("index",0);
		return "member/shopPayList";
	}
	
	//캠핑용품 결제 리스트
	@RequestMapping(value = "/productPayList.do")
	public String productPayList(int reqPage,String memberId, Model model) {
		ProductPageData ppd = service.productPayList(memberId, reqPage);	
		model.addAttribute("list", ppd.getList() );
		model.addAttribute("navi", ppd.getPageNavi() );
		model.addAttribute("index",1);
		return "member/productPayList";
	}
	
	//내가 쓴 캠핑장리뷰
	@RequestMapping(value = "/myRiview.do")
	public String myRiview(int reqPage,String memberId, Model model) {
		ReviewPageData rpd = service.myReviewList(memberId, reqPage);
		model.addAttribute("list",rpd.getList());
		model.addAttribute("navi", rpd.getPageNavi());
		model.addAttribute("index",2);
		return "member/myReviewList";
	}
	
	//찜한목록
	@RequestMapping(value = "/usedWishList.do")
	public String usedWishList(int reqPage,String memberId, Model model) {
		model.addAttribute("index",4);
		return "member/usedWishList";
	
	}
	

	//판매자 my캠핑장
	@RequestMapping(value = "/sellList.do")
	public String sellList(int reqPage,String memberId, Model model) {
		SellCampingListData scld = cmapingService.getSellCampingList(memberId, reqPage);
		model.addAttribute("list",scld.getCampingList());
		model.addAttribute("navi", scld.getPageNavi());
		return "member/sellList";
	}
	
	
	
	
	
}
