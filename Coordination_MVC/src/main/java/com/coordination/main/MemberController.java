package com.coordination.main;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coordination.dto.ClosetVO;
import com.coordination.dto.MemberVO;
import com.coordination.service.ClosetService;
import com.coordination.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ClosetService closetService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//member 회원가입
	@RequestMapping(value = "insertMember", method = RequestMethod.POST)
	public String insert(MemberVO vo, Model model, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			memberService.insertMember(vo);
			
			out.println("<script>"
					+ "alert('가입완료! 로그인 페이지로 이동합니다.');"
        			+ "</script>");
            out.flush();
            
            //로그인 페이지로 이동
            model.addAttribute("url", "insertMember");
            
		}catch(Exception e) {
			e.printStackTrace();
			
			out.println("<script>"
					+ "alert('회원가입에 실패했습니다. 다시 한 번 시도해주세요.');"
					+ "history.back();"
        			+ "</script>");
            out.flush();
        
		}
		
		return "movePage";
	}
	
	//member 정보수정
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String update(MemberVO vo, Model model, HttpServletResponse response)throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			memberService.updateMember(vo);
			
			out.println("<script>"
					+ "alert('회원정보가 정상적으로 변경되었습니다.');"
        			+ "</script>");
            out.flush();
            
            //마이 페이지로 이동
            model.addAttribute("url", "updateMember");
            
		}catch(Exception e) {
			e.printStackTrace();
			
			out.println("<script>"
					+ "alert('Error!!!');"
					+ "history.back();"
        			+ "</script>");
            out.flush();
            
		}
		
		return "movePage";
	}
	
	//member 정보삭제
	@RequestMapping(value = "deleteMember", method = RequestMethod.GET)
	public String delete(MemberVO vo, Model model, HttpServletResponse response)throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			//vo.setId("client01");
			
			//탈퇴유저 처리
			//ID,PASSWORD를 제외한 모든 회원정보를 랜덤으로 변경하여 정보 파기
			//비밀번호를 안바꾸는 이유는 로그인 처리에서 vo는 있지만 ghost가 y인 것만 구분하기 위해
			//그렇기에 회원가부터 암호화
			vo.setName(RandomStringUtils.randomAscii(1));
			vo.setPhone(RandomStringUtils.random(1));
			vo.setGhost("y");
			
			memberService.deleteMember(vo);
			
			out.println("<script>"
					+ "alert('회원정보가 정상적으로 삭제되었습니다.');"
        			+ "</script>");
            out.flush();
            
            //메인 페이지로 이동
            model.addAttribute("url", "deleteMember");
            
		}catch(Exception e) {
			e.printStackTrace();
			
			out.println("<script>"
					+ "alert('Error!!!');"
					+ "history.back();"
        			+ "</script>");
            out.flush();
            
		}
		
		return "movePage";
	}
	//로그인 처리
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public String loginCheck(MemberVO vo, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		
		String url = null;
		
		response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		response.getWriter();
		 
		
		try {
			String result = memberService.loginCheck(vo, session, request);
			
						
			//로그인 성공
			if(result.equals("success"))
			{
				//메인 페이지로 이동
				model.addAttribute("url", "loginSuccess");
				url = "movePage";
			}
			//탈퇴한 회원
			else if(result.equals("ghost"))
			{
				//메인 페이지로 이동
				out.println("<script>" 
						+ "alert('탈퇴한 회원입니다.');"
						+ "</script>");
				out.flush();
				
				model.addAttribute("url", "loginGhost");
				url = "movePage";
			}
			//로그인 실패
			else
			{
				model.addAttribute("login", "fail");
				url = "coordination/member/login";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			logger.info("Error!!");
		}
		
		return url;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		
		//세션 삭제
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		//메인 Page이동
		return "redirect:/";
	}

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
	public String myPage(ClosetVO vo, Model model, HttpSession session) throws Exception {
		
		if(session.getAttribute("userId") == null)
		{
			return "redirect:/";
		}
		else
		{
			String id = session.getAttribute("userId").toString();
			vo.setId(id);
			
			List<ClosetVO> ClosetList = closetService.closetList(vo);
			model.addAttribute("ClosetList", ClosetList);
			
			return "coordination/member/myPage";
		}
	}
}
