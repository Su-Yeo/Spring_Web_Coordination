package com.coordination.main;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coordination.dto.DressroomVO;
import com.coordination.service.DressroomService;

@Controller
public class DressroomController {
	
	@Autowired
	private DressroomService service;

	//회원 - 나만의 코디룸에 원하는 사진을 저장
	@RequestMapping(value = "dressInsert", method = RequestMethod.GET)
	public String insert(DressroomVO vo, Model model, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
		
		String userId = session.getAttribute("userId").toString();
		//회원이 원하는 이미지를 등록
		String img = request.getParameter("img");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			
			//id, img
			vo.setId(userId);
			vo.setImg(img);
			
			int result = service.selectImg(vo);
			if(result > 0)
			{
				out.println("<script>"
						+ "alert('해당 코디룩이 이미 존재합니다.');"
	        			+ "</script>");
	            out.flush();
			}
			else
			{
				service.insertDressroom(vo);
				
				out.println("<script>"
						+ "alert('코디룩을 저장합니다.');"
	        			+ "</script>");
	            out.flush();
			}
			
            model.addAttribute("url", "insertDressroom");
            
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
	
	//회원 - 나만의 코디룸 가져옴
	@RequestMapping(value = "dressSelect", method = RequestMethod.GET)
	public String select(DressroomVO vo, Model model, HttpSession session) throws Exception {
		String userId = session.getAttribute("userId").toString();
		
		vo.setId(userId);
		
        model.addAttribute("dressroomList", service.dressroomList(vo));
 		
		return "coordination/member/myPage";
	}
	
	//회원 - 나만의 코디룸에서 원하는 사진을 삭제
	@RequestMapping(value = "dressDelete", method = RequestMethod.GET)
	public String delete(DressroomVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = 0;
		num = Integer.parseInt(request.getParameter("num"));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			
			vo.setNum(num);
			service.deleteDressroom(vo);
			
			out.println("<script>"
					+ "alert('코디룩을 삭제합니다.');"
        			+ "</script>");
            out.flush();
			
            model.addAttribute("url", "deleteDressroom");
			
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
