package kr.or.iei.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MemberPageData;
import kr.or.iei.member.model.vo.ProductPageData;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	
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
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
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
	

	@RequestMapping(value = "/mypageC.do")
	public String mypageC() {
		return "member/mypageCFrm";
	}
	//------------------------------------ä��
	//------------------------------------ä��
	@RequestMapping(value ="/allMemberChatFrm.do")
	public String allMemberChatFrm() {
		return"member/allMemberChatFrm";
		}
	
	@RequestMapping(value = "/allMemberChat.do")
	public String allMemberChat() {
		return "member/allMemberChat";
	}
	
	/*
	@RequestMapping(value = "/updateMypageC.do")
	public String updateMypageC(Member member, HttpSession session) {
		Member loginMember = service.selectOneMember(member);
		if(loginMember == session) {
			return "member/updateMypageCFrm";
			
		}
		return "member/mypageCFrm";
	}
	*/
	
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
	public String updateMypageCFrm() {
		return "member/updateMypageCFrm";
	}
	
	//회원탈퇴
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
		return "member/shopPayList";
	}
	
	
	//캠핑용품 결제 리스트
	@RequestMapping(value = "/productPayList.do")
	public String productPayList(int reqPage,String memberId, Model model) {
		ProductPageData ppd = service.productPayList(memberId, reqPage);	
		model.addAttribute("list", ppd.getList() );
		model.addAttribute("navi", ppd.getPageNavi() );
		return "member/productPayList";
	}
	
	
}




