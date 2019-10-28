package com.coordination.main;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.coordination.admin.TensorflowImpl;
import com.coordination.dto.ClosetVO;
import com.coordination.service.ClosetService;

@Controller
public class ClosetController {

	@Resource(name="imgPath")
	private String imgPath;
	
	@Autowired
	private ClosetService service;
	
	//회원 - 나만의 옷장 등록
	@RequestMapping(value = "insertCloset", method = {RequestMethod.GET, RequestMethod.POST})
	public String insert(ClosetVO vo, Model model, HttpServletResponse response, HttpSession session, HttpServletRequest request) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		TensorflowImpl tf = new TensorflowImpl();
		
		//img
		String Path = "C:\\img\\user\\";
		String image = Path + RequestContextUtils.getInputFlashMap(request).get("savePath").toString();
		String img = RequestContextUtils.getInputFlashMap(request).get("savePath").toString();
		
		try {

			//사용자 이미지 업로드 후, 분석
			tf.user(image);
			
			out.println("<script>"
					+ "alert('이미지의 색상이 분석되었습니다.');"
        			+ "</script>");
            out.flush();
			
	    	//model.addAttribute("url", "identifyCloset");
            
            //Setter
            vo.setImg(img);
            //Getter
            List<ClosetVO> closetList = service.closetList(vo);
            model.addAttribute("closetList", closetList);
			
		}catch(Exception e) {
			e.printStackTrace();
			
			out.println("<script>"
					+ "alert('Error!!!');"
					+ "history.back();"
        			+ "</script>");
            out.flush();
		}
		
		return "coordination/member/imgUpload2";
	}
	
	//회원 - 나만의 옷장 등록 후 수정
	@RequestMapping(value = "updateCloset", method = RequestMethod.POST)
	public String update(ClosetVO vo, Model model, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			service.updateCloset(vo);
			
			out.println("<script>"
					+ "alert('정상적으로 등록되었습니다.');"
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
	@RequestMapping(value = "deleteCloset", method = RequestMethod.GET)
	public String delete(ClosetVO vo, Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		int num = 0;
		num = Integer.parseInt(request.getParameter("num"));
		
		String img = request.getParameter("img");
		String Path = "C:\\img\\user\\" + img;
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			
			//프로젝트 내에 이미지 파일을 삭제하기 위한 파일 객체 선언
			File file = new File(Path);
			//해당 파일이 존재한다면 DB정보 삭제 + 이미지 삭제
			if(file.exists() == true)
			{
				vo.setNum(num);
				service.deleteCloset(vo);
				file.delete();
				
				out.println("<script>"
						+ "alert('삭제가 완료되었습니다.');"
	        			+ "</script>");
	            out.flush();
			}
			else
			{
				out.println("<script>"
						+ "alert('Error!!!');"
						+ "history.back();"
	        			+ "</script>");
	            out.flush();
			}
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
