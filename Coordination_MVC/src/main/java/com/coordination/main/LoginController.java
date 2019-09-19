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

import com.coordination.dto.MemberVO;
import com.coordination.service.MemberService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private MemberService service;
	
	//로그인 처리
	@SuppressWarnings("unused")
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			vo = service.loginCheck(vo, session, request, response);
			
			//로그인 성공
			if(vo != null)
			{
				//로그인 성공 후, 이동할 페이지
				mav.setViewName("");
			}
			//탈퇴한 회원이 로그인을 시도했을 경우
			else if(vo != null && vo.getGhost().equals("y"))
			{
				//메인으로 이동
				mav.setViewName("");
			}
			//아이디 또는 비밀번호 오류
			else
			{
				//로그인 페이지로 이동
				mav.setViewName("");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			logger.info("Error!!");
		}
		
		return mav;
	}
}
