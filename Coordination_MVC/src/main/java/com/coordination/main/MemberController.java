package com.coordination.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("isMyPage")
	public String myPage(HttpSession session, Model model) {
		
		String url = null;
		
		if(session.getAttribute("userId") == null)
		{
			//비로그인한 User가 페이지에 접근할 경우
			url = "movePage";
			model.addAttribute("url", "GhostMyPage");
		}
		else
		{
			//로그인한 회원이 페이지에 접근할 경우
			url = "coordination/member/myPage";
		}
		
		return url;
	}
}
