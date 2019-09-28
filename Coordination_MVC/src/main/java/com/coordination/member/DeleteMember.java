package com.coordination.member;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coordination.dto.MemberVO;
import com.coordination.service.MemberService;

@Controller
public class DeleteMember {

	@Inject
	private MemberService service;
	
	@RequestMapping(value = "deleteMember", method = RequestMethod.GET)
	public ModelAndView insert(MemberVO vo, HttpServletResponse response)throws Exception {
	
		ModelAndView mav = new ModelAndView();
		
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
			
			service.deleteMember(vo);
			
			out.println("<script>"
					+ "alert('회원정보가 정상적으로 삭제되었습니다.');"
        			+ "</script>");
            out.flush();
            
            mav.setViewName("movePage");
            mav.addObject("url", "deleteMember");
            
		}catch(Exception e) {
			e.printStackTrace();
			
			out.println("<script>"
					+ "alert('Error!!!');"
					+ "history.back();"
        			+ "</script>");
            out.flush();
            
		}
		
		return mav;
	}
}
