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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.member.model.service.MailService;
import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MemberPageData;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	@Autowired
	private MailService mailService;
	
	
	@RequestMapping(value="/mailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String mailCheck(String memberEmail) {
		System.out.println("이메일 인증 요청 성공 ");
		System.out.println("이메일 인증 이메일 : " + memberEmail);
		return mailService.mailCheck(memberEmail);
	}
	
	
	
	
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
	
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("memberId") String memberId) {
		return service.idCheck(memberId);
	}
	
	@RequestMapping(value = "/mypageC.do")
	public String mypageC() {
		return "member/mypageCFrm";
	}
	//------------------------------------채占쏙옙
	//------------------------------------채占쏙옙
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
	
	//�쉶�썝�깉�눜
	@RequestMapping(value = "/deleteMember.do")
	public String deleteMember(int memberNo) {
		int result = service.deleteMember(memberNo);
		if(result>0) {
			return "redirect:/logout.do";
		}else {
			return "redirect:/";
		}
	}
	
	//罹좏븨�옣 寃곗젣 �궡�뿭 由ъ뒪�듃
	/*
	@RequestMapping(value = "/cmapingPayList.do")
	public String cmapingPayList(int reqPage,int memberNo, Model model) {
		ArrayList<CampingPayment> list = service.selectPayList(memberNo, reqPage);	
		model.addAttribute("list", list );
		return "member/shopPayList";
	}
	*/
	@RequestMapping(value = "/cmapingPayList.do")
	public String cmapingPayList(int reqPage,int memberNo, Model model) {
		MemberPageData mpd = service.selectPayList(memberNo, reqPage);	
		model.addAttribute("list", mpd.getList() );
		model.addAttribute("navi", mpd.getPageNavi() );
		return "member/shopPayList";
	}
	

	//罹좏븨�슜�뭹 寃곗젣 由ъ뒪�듃
	/*
	//캠핑용품 결제 리스트
	
	@RequestMapping(value = "/productPayList.do")
	public String productPayList(int reqPage,int memberNo, Model model) {
		return "member/productPayList";
	}
	*/
	
}





