package com.coordination.main;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coordination.dto.StyleVO;
import com.coordination.service.StyleService;

//Update Delete 구문 이외에 모든 작업을 담당하는 컨트롤러
@Controller
public class StyleController {

	@Autowired
	private StyleService service;
	
	private static final Logger logger = LoggerFactory.getLogger(StyleController.class);
	
	@RequestMapping("adminStyleList")
	public String goStyleList(Model model) throws Exception {
		
		List<StyleVO> StyleList = service.StyleList();
			
		model.addAttribute("StyleList", StyleList);
		
		return "coordination/admin/style/StyleList";
	}

	//관리자 - style 변경 Page 이동
	//추후 GET방식을 통해 num값을 넘겨받은 다음 수행하도록 개발해야 함
	@RequestMapping(value = "adminUpdate", method = RequestMethod.GET)
	public String goUpdateStyle(HttpServletRequest request, StyleVO vo, Model model) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		List<StyleVO> StyleOne = service.StyleOne(vo, num);
		model.addAttribute("StyleOne", StyleOne);
		
		return "coordination/admin/style/updateForm";
	}
	
	//관리자 - style 변경
	@RequestMapping(value = "updateStyle", method = RequestMethod.POST)
	public String update(StyleVO vo, HttpServletResponse response, Model model) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			service.updateStyle(vo);
			
			out.println("<script>"
					+ "alert('이미지의 정보가 수정되었습니다.');"
        			+ "</script>");
            out.flush();
            
            //업데이트 완료 후, StyleList로 이동
            model.addAttribute("url", "updateStyle");
			
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
	
	//관리자 - style 삭제
	@RequestMapping(value = "deleteStyle")
	public String delete(HttpServletRequest request, StyleVO vo, Model model) throws Exception {
		
		//삭제하기 위한 Num 초기화 후 할당
		int num = 0;
		num = Integer.parseUnsignedInt(request.getParameter("num"));
		
		//삭제된 정보의 이미지명을 받아 프로젝트 내에 존재하는 해당 이미지 파일 삭제
		String img = request.getParameter("img");
		String path = "C:\\Users\\sangw\\Coordination_MVC\\Coordination_MVC"
				+ "\\src\\main\\webapp\\resources\\"
				+ "admin\\" + img;
		
		try {
			vo.setNum(num);

			//프로젝트 내에 이미지 파일을 삭제하기 위한 파일 객체 선언
			File file = new File(path);
			
			//해당 파일이 존재한다면 DB정보 삭제 + 이미지 삭제
			if(file.exists() == true)
			{
				service.deleteStyle(vo);
				file.delete();
				
				//삭제 완료 후, StyleList로 이동
				logger.info("==========이미지를 정상적으로 삭제했습니다.==========");
			}
			else
			{
				//해당 Path에 이미지가 존재하지 않아 삭제불가능
				logger.info("==========이미지가 존재하지않아 삭제에 실패했습니다.==========");
			}
			
			model.addAttribute("url", "deleteStyle");
			
		}catch(Exception e) {
			e.printStackTrace();
			
			logger.info("==========Error!!!==========");
            model.addAttribute("url", "delete");
		}
		
		return "movePage";
	}
}
