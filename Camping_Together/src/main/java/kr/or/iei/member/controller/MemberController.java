package kr.or.iei.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.iei.member.model.service.MemberService;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;
}
