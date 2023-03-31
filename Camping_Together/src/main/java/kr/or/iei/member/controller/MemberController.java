package kr.or.iei.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/login.do")
	public String login(Member member, HttpSession session){
	//public String login(Member member) {
		Member loginMember = service.selectOneMember(member);
		if(loginMember != null) {
			session.setAttribute("m", loginMember);
		}
		System.out.println("�α��� �Ϸ�");
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
			return "redirect:/";
		}else {
			return "redirect:/joinFrm.do";
		}
	}
	

	
	//-----------------------------------����������
	@RequestMapping(value = "/mypageC.do")
	public String mypageC() {
		return "member/mypageCFrm";
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
	
	
	
}
