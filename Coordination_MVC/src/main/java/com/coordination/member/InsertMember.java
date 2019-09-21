package com.coordination.member;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coordination.dto.MemberVO;
import com.coordination.service.MemberService;

@Controller
public class InsertMember {

	@Inject
	private MemberService service;
	
	@RequestMapping(value = "inserMember", method = RequestMethod.POST)
	public String insert(MemberVO vo, HttpServletResponse response, Model model)throws Exception {
	
		//로그인 RequestMapping
		String url = "redirect:/login";
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			service.insertMember(vo);
			
			out.println("<script>"
					+ "alert('가입완료! 로그인 페이지로 이동합니다.');"
        			+ "</script>");
            out.flush();
		}catch(Exception e) {
			//예외처리
			out.println("<script>"
					+ "alert('회원가입에 실패했습니다. 다시 한 번 시도해주세요.');"
					+ "history.back();"
        			+ "</script>");
            out.flush();
		}
		return url;
	}
}
