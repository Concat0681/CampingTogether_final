package kr.or.iei.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.sun.xml.internal.ws.developer.Serialization;

@Service
public class MailService {
	
	
	private JavaMailSenderImpl mailSender;
	private int authNumber; 
	// 난수 발생
	public String mailCheck(String memberEmail) {

		System.out.println("넘어오냐? ");
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
		
		//이메일 보낼 양식
		String setFrom = "bumjin098@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = memberEmail;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"Welcome Camping Together " + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 입력해 주세요."; //이메일 내용 삽입
		
		//이메일 전송
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(authNumber);
		return num;
	}

}
