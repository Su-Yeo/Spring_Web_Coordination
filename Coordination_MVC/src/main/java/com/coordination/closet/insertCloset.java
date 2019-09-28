package com.coordination.closet;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coordination.dto.ClosetVO;
import com.coordination.service.ClosetService;

@Controller
public class insertCloset {

	@Autowired
	private ClosetService service;
	
	@RequestMapping(value = "insertCloset", method = RequestMethod.POST)
	public ModelAndView insert(ClosetVO vo, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			
			service.insertCloset(vo);
			
			out.println("<script>"
					+ "alert('정상적으로 등록되었습니다.');"
        			+ "</script>");
            out.flush();
            
            //MyPage로 이동
            mav.setViewName("movePage");
            mav.addObject("url", "insertCloset");
			
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
