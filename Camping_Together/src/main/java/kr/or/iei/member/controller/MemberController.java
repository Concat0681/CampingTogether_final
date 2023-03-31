package kr.or.iei.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		System.out.println("ï¿½Î±ï¿½ï¿½ï¿½ ï¿½Ï·ï¿½");
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
	
	
	
	//-----------------------------------¸¶ÀÌÆäÀÌÁö
	@RequestMapping(value = "/mypageC.do")
	public String mypageC() {
		return "member/mypageCFrm";
	}
	
	
	
}
