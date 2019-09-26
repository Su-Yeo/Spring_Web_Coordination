package com.coordination.style;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coordination.dto.StyleVO;
import com.coordination.service.StyleService;

@Controller
public class DeleteStyle {

	@Autowired
	private StyleService service;
	
	@RequestMapping(value = "deleteStyle")
	public String delete(HttpServletRequest request, StyleVO vo, HttpServletResponse response, Model model) throws Exception {
		
		int num = 0;
		num = Integer.parseUnsignedInt(request.getParameter("num"));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			vo.setNum(num);
			service.deleteStyle(vo);
			
			out.println("<script>"
					+ "alert('이미지의 정보가 삭제되었습니다.');"
        			+ "</script>");
            out.flush();
            
            //삭제 완료 후, StyleList로 이동
            model.addAttribute("url", "delete");
			
		}catch(Exception e) {
			e.printStackTrace();
			
			out.println("<script>"
					+ "alert('Error!!!');"
					+ "history.back();"
        			+ "</script>");
            out.flush();
		}
		
		return "coordination/admin/movePage";
	}
}
