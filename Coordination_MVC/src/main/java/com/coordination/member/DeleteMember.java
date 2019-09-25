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
			vo.setId("sangwon3");
			//탈퇴유저 처리
			vo.setGhost("y");
			//비밀번호 20자리 랜덤 초기화
			vo.setPassword(RandomStringUtils.randomAscii(20));
			
			//정상적으로 등록 완료 시, 로그인 페이지로 이동
			service.deleteMember(vo);
			mav.setViewName("coordination/index");
			
			out.println("<script>"
					+ "alert('회원정보가 정상적으로 삭제되었습니다.');"
        			+ "</script>");
            out.flush();
		}catch(Exception e) {
			//예외처리
			mav.setViewName("");
			
			out.println("<script>"
					+ "alert('Error!!! 다시 한 번 시도해주세요.');"
        			+ "</script>");
            out.flush();
		}
		return mav;
	}
}
