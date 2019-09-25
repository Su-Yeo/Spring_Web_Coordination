package com.coordination.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	//member 회원가입 Page이동
	@RequestMapping("signup")
	public String SignUp() {
		
		return "coordination/member/signUp";
	}
	
	//member 로그인 Page이동
	@RequestMapping("login")
	public String login() {
		
		return "coordination/member/login";
	}
}
