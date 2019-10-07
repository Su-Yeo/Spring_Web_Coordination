package com.coordination.main;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coordination.dto.ClosetVO;
import com.coordination.service.ClosetService;

@Controller
public class ClosetController {

	@Autowired
	private ClosetService service;
	
	//회원 - 나만의 옷장 등록
	@RequestMapping(value = "insertCloset", method = RequestMethod.POST)
	public ModelAndView insert(ClosetVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			//Id
			String userId = session.getAttribute("userId").toString();
			
			//category
	    	String category = null;
	    	category = "t shirt";
	    	
	    	//color
	    	String color = null;
	    	color = "black";
	    	
	    	//img
	    	String img = null;
	    	
	    	vo.setId(userId);
	    	vo.setCategory(category);
	    	vo.setColor(color);
	    	vo.setImg(img);
			
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
	
	//회원 - 나만의 옷장 수정
	@RequestMapping(value = "updateCloset", method = RequestMethod.POST)
	public String update(ClosetVO vo, HttpServletResponse response, Model model) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			service.updateCloset(vo);
			
			out.println("<script>"
					+ "alert('수정이 완료되었습니다.');"
        			+ "</script>");
            out.flush();
            
            model.addAttribute("url", "updateCloset");
			
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
	
	//회원 - 나만의 옷장 삭제
	@RequestMapping(value = "deleteCloset", method = RequestMethod.POST)
	public String delete(ClosetVO vo, HttpServletResponse response, Model model) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			service.deleteCloset(vo);
			
			out.println("<script>"
					+ "alert('삭제가 완료되었습니다.');"
        			+ "</script>");
            out.flush();
            
            model.addAttribute("url", "deleteCloset");
			
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
}
