package com.coordination.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coordination.dto.MemberVO;
import com.coordination.service.MemberService;

@Controller
public class InsertMember {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "inserMember", method = RequestMethod.POST)
	public String insert(MemberVO vo, HttpServletResponse response) throws IOException {
		
		//ModelAndView mav = new ModelAndView();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {

			//service.insertMember(vo);
			vo = service.signUpCheck(vo);
			if(vo != null)
			{
				System.out.println(vo.getId());
				System.out.println(vo.getName());
			}
			else
			{
				System.out.println("사용가능한 아이디입니다.");
			}
			
			out.println("<script>"
					+ "alert('가입완료! 로그인 페이지로 이동합니다.');"
        			+ "</script>");
            out.flush();
            
            //mav.setViewName("coordination/member/signUpOK");
		}catch(Exception e) {
			e.printStackTrace();
			out.println("<script>"
					+ "alert('회원가입에 실패했습니다. 다시 한 번 시도해주세요.');"
        			+ "</script>");
            out.flush();
            
            //mav.setViewName("coordination/member/signUpFail");
		}
		
		return null;
	}
}
