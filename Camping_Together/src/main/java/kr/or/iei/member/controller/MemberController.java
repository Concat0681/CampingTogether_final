package kr.or.iei.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MemberPageData;

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
	
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("memberId") String memberId) {
		return service.idCheck(memberId);
	}
	
	@Service
	@RequiredArgsConstructor
	public class EmailService {

		//의존성 주입을 통해서 필요한 객체를 가져온다.
	    private final JavaMailSender emailSender;
	    // 타임리프를사용하기 위한 객체를 의존성 주입으로 가져온다
	    private final SpringTemplateEngine templateEngine;
	    private String authNum; //랜덤 인증 코드

	    //랜덤 인증 코드 생성
	    public void createCode() {
	        Random random = new Random();
	        StringBuffer key = new StringBuffer();

	        for(int i=0;i<8;i++) {
	            int index = random.nextInt(3);

	            switch (index) {
	                case 0 :
	                    key.append((char) ((int)random.nextInt(26) + 97));
	                    break;
	                case 1:
	                    key.append((char) ((int)random.nextInt(26) + 65));
	                    break;
	                case 2:
	                    key.append(random.nextInt(9));
	                    break;
	            }
	        }
	        authNum = key.toString();
	    }
	    /*
	    //메일 양식 작성
	    public MimeMessage createEmailForm(String email) throws MessagingException, UnsupportedEncodingException {

	        createCode(); //인증 코드 생성
	        String setFrom = "bumjin098@gmail.com"; //email-config에 설정한 자신의 이메일 주소(보내는 사람)
	        String toEmail = email; //받는 사람
	        String title = "CODEBOX 회원가입 인증 번호"; //제목
	       
	        MimeMessage message = service.createMimeMessage();
	        message.addRecipients(MimeMessage.RecipientType.TO, email); //보낼 이메일 설정
	        message.setSubject(title); //제목 설정
	        message.setFrom(setFrom); //보내는 이메일
	        message.setText(setContext(authNum), "utf-8", "html");
			
	        return message;
	    }
		
	    //실제 메일 전송
	    public String sendEmail(String toEmail) throws MessagingException, UnsupportedEncodingException {
	    
	        //메일전송에 필요한 정보 설정
	        MimeMessage emailForm = createEmailForm(toEmail);
	        //실제 메일 전송
	        emailSender.send(emailForm);

	        return authNum; //인증 코드 반환
	    }

	    //타임리프를 이용한 context 설정
	    public String setContext(String code) {
	        Context context = new Context();
	        context.setVariable("code", code);
	        return templateEngine.process("mail", context); //mail.html
	    }

	}
	*/
	
	
	
	
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




