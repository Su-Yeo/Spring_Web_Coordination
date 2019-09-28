package com.coordination.main;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.coordination.dto.MemberVO;
import com.coordination.service.MemberService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private MemberService service;
	
	//로그인 처리
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			String result = service.loginCheck(vo, session, request);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			//로그인 성공
			if(result.equals("success"))
			{
				//메인 페이지로 이동
				mav.setViewName("movePage");
				mav.addObject("url", "loginSuccess");
			}
			//탈퇴한 회원
			else if(result.equals("ghost"))
			{
				out.println("<script>"
						+ "alert('탈퇴한 회원정보입니다');"
	        			+ "</script>");
	            out.flush();
	            
	          //메인 페이지로 이동
				mav.setViewName("movePage");
				mav.addObject("url", "loginGhost");
			}
			//로그인 실패
			else
			{
				out.println("<script>"
						+ "alert('아이디 또는 비밀번호가 틀렸습니다.');"
						+ "history.back();"
	        			+ "</script>");
	            out.flush();

			}
			
		}catch(Exception e) {
			e.printStackTrace();
			logger.info("Error!!");
		}
		
		return mav;
	}
}
